class Asp::Job
  attr_accessor :configuration, :solver
  delegate :time_out, :time_out=, :to => :solver

  def initialize
    @fact_classes = [Room, Weekday, Timeframe, Course, Curriculum, Room::Unavailability, Teacher::Unavailability, Curriculum::Unavailability]
    @solver = Asp::Solver.new
  end

  def configuration
    @configuration ||= Asp::Configuration.default
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

    if ((Rails.env == "debug") || (Rails.env == "test"))
      File.open("script/debug.lp", 'w') { |file| file.write(encoding) }
    end
    #binding.pry

    if (solver.solve(encoding))
      Timetable.destroy_all
      solver.models.each_with_index do |model, i|
        ActiveRecord::Base.transaction do
          timetable = Timetable.new
          timetable.id = i
          timetable.costs = model.costs
          timetable.optimum = model.optimum
          model.extract(Timetable::Entry).each do |entry|
            entry.timetable_id = timetable.id
            entry.save!
          end
          model.extract(Timetable::OverfullRoom).each do |overfull|
            overfull.save!
          end
          timetable.save!
        end
      end
    else
      raise "ASP solving raised errors!"
    end
  end


end
