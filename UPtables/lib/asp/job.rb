class Asp::Job
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
    @optimize = true # default
  end

  def configuration
    @configuration ||= Asp::Configuration.default
  end

  def optimize=(o)
    if (o)
      @configuration = Asp::Configuration.default
      @optimize = true
    else
      @configuration = Asp::Configuration.only_hard_constraints
      @optimize = false
    end
  end

  def collect_facts
    collected_facts = ""
    @fact_classes.each do |aclass|
      if aclass.respond_to?(:to_fact)
        collected_facts += aclass.to_fact #periods_per_day(..) and days(...)
        collected_facts += "\n"
      end
    end

    @fact_classes.each do |aclass|
      if aclass.method_defined?(:to_fact)
        aclass.all.each do |instance|
          collected_facts +=  instance.to_fact #room(...) course(..)
          collected_facts += "\n"
        end
      end
    end
    collected_facts
  end

  def run
    encoding = collect_facts
    encoding += "\n"
    encoding += configuration.asp_rule_encoding

    if ((Rails.env == "development") || (Rails.env == "test"))
      File.open("script/debug.lp", 'w') { |file| file.write(encoding) }
    end
    #binding.pry

    solutions = self.solve(encoding)
    if solutions
      Timetable.destroy_all
      solutions.each_with_index do |model, i|
        ActiveRecord::Base.transaction do
          timetable = Timetable.new
          timetable.id = i+1
          timetable.costs = model.costs
          timetable.optimum = model.optimal?
          model.each do |entity|
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


  def solve(problem_string)
    problem = Asp::Problem.new(problem_string)
    problem.post_processing do |solution, element|
      if element.respond_to?(:assign_reference)
        solution.find {|e| element.assign_reference(e) }
      end
    end
    problem.timeout(self.time_out)
    result = problem.solutions(:suboptimal => self.optimize)
    if result.any? {|model| model.optimal? }
      result = result.select {|model| model.optimal?}
    end
    result
  end

end
