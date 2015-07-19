class Timetabling::Job
  attr_accessor :time_out, :optimize
  attr_reader :problem
  attr_reader :constraint_methods
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
    @constraint_methods = {}
    @constraint_methods[:teacher_availability] = true
    @constraint_methods[:room_availability] = true
    @constraint_methods[:committee_date] = false # deactivated to run tests easier
    @constraint_methods[:same_curriculum_and_mandatory] = true
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
    @constraint_methods.each { |method, active|  self.send(method) if active}

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


  # Teacher availability constraint: If the teacher of the course is not available to
  # teach that course at a given period, then no lecture of the course
  # can be scheduled at that period. Each lecture in a period
  # unavailable for that course is one violation.
  def teacher_availability
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

  # Room Availability: If a room is unavailable during a certain time,
  # lectures must not be held in this room at that time.
  def room_availability
    @problem.never{
      same(:room_id, :weekday_id, :timeframe_id).for(Timetable::Entry, Room::Unavailability)
    }
  end


  # If there is a certain time when all professors are free, this slot can be used
  # to have a professors committee. We must have at least one such slot.
  def committee_date
    @problem.make(Timetable::CommitteeDate.asp(:weekday_id => "WD", :timeframe_id => "TF")) {
      conjunct{[
        Timeframe.asp(:global_id => "TF"),
        Weekday.asp(:global_id => "WD"),
        no {Timetable::Entry.asp( :timeframe_id  => "TF", :weekday_id => "WD")},
        no {Teacher::Unavailability.asp(:timeframe_id => "TF", :weekday_id => "WD")}
      ]}
    }
    @problem.never { no { Timetable::CommitteeDate.asp() }}
  end

  def same_curriculum_and_mandatory
    @problem.avoid(1, :name => "same_curriculum_and_mandatory") {
      conjunct{[
        Timetable::Entry.asp(:course_component_id => "C1", :weekday_id => "WD", :timeframe_id => "TF"),
        Timetable::Entry.asp(:course_component_id => "C2", :weekday_id => "WD", :timeframe_id => "TF"),
        CurriculumModuleAssignment.asp(:course_component_id => "C1", :curriculum_id => "Cu"),
        CurriculumModuleAssignment.asp(:course_component_id => "C2", :curriculum_id => "Cu"),
        "C1 != C2" ]}
}
  end

end
