class Timetabling::Job
  attr_accessor :time_out, :optimize
  delegate :set, :to => :configuration

  def initialize
    @fact_classes = [
      Room,
      Weekday,
      Timeframe,
      Course,
      Course::Component,
      Curriculum,
      Room::Property,
      Room::Unavailability,
      Teacher::Unavailability,
      Curriculum::Unavailability,
      CurriculumModuleAssignment,
      TimeWindow
]
    @output_classes = [
      Timetable::Entry,
      Timetable::CommitteeDate,
      Timetable::OverfullRoom
    ]

    @optimize = true # default
    @problem = Asp::Problem.new
  end

  def configuration
    @configuration ||= Timetabling::Configuration.default
  end

  def optimize=(o)
    if (o)
      @configuration = Timetabling::Configuration.default
      @optimize = true
    else
      @configuration = Timetabling::Configuration.only_hard_constraints
      @optimize = false
    end
  end

  def run
    solutions = self.solve
    if solutions
      Timetable.destroy_all
      solutions.each_with_index do |solution, i|
        ActiveRecord::Base.transaction do
          timetable = Timetable.new
          timetable.id = i+1
          timetable.costs = solution.costs
          timetable.optimum = solution.optimal?
          solution.each do |entity|
            if (entity.respond_to?(:timetable_id))
              entity.timetable_id = timetable.id
            end
            unless entity.save
              binding.pry
            end
            entity.save!
          end
          timetable.save!
        end
      end
    end
  end


  def solve
    @fact_classes.each do |aclass|
      @problem.add(aclass) if aclass.respond_to?(:asp_representation)
      aclass.find_each do |instance|
        @problem.add(instance)
      end
    end
    @problem.add(  configuration.asp_rule_encoding )

    # constraints
    availability

    if ((Rails.env == "development") || (Rails.env == "test"))
      File.open("script/debug.lp", 'w') { |file| file.write(@problem.asp_representation) }
    end
    #binding.pry

    @problem.post_processing do |solution, element|
      if element.respond_to?(:assign_reference)
        solution.find {|e| element.assign_reference(e) }
      end
    end
    @problem.timeout(self.time_out)
    result = @problem.solutions(:suboptimal => self.optimize)
    # if we find an optimal, we only want optimal solutions and get rid of the rest
    if result.any? {|solution| solution.optimal? }
      result = result.select {|solution| solution.optimal?}
    end
    # TODO: Generic approach
    result.each {|solution| solution.keep_if {|e| @output_classes.any?{|c| e.is_a?(c)} } }
    result
  end


  # Availability constraint: If the teacher of the course is not available to
  # teach that course at a given period, then no lecture of the course
  # can be scheduled at that period. Each lecture in a period
  # unavailable for that course is one violation.
  def availability
    @problem.never{ 
            conjunct{ [
              Timetable::Entry.asp(:course_component_id => "C",
                                   :weekday_id => "WD",
                                   :timeframe_id => "TF"),
              Course::Component.asp(:id => "C",
                                      :teacher_id => "T"),
              Teacher::Unavailability.asp(:teacher_id => "T",
                                          :weekday_id => "WD",
                                          :timeframe_id => "TF")

            ]}
    }
  end
end
