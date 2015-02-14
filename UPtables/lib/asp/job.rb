class Asp::Job

  def run
    timetabling = IO.read("./script/timetabling.lp")
    new_facts = ""
    [Room, Weekday, Timeframe, Course].each do |fact_class|
      new_facts += fact_class.to_fact #periods_per_day(..) and days(...)
      new_facts += "\n"
    end
    new_facts += "\n"
    [Room, Room::Unavailability, Course, Teacher::Unavailability].each do |fact_class|
      fact_class.all.each do |fact_instance|
        new_facts += fact_instance.to_fact # room(...) course(...)
        new_facts += "\n"
      end
      new_facts += "\n"
    end
    encoding = new_facts
    encoding += "\n"
    encoding += timetabling

    File.open("script/debug.lp", 'w') { |file| file.write(encoding) }
    solver = Asp::Solver.new
    if (solver.solve(encoding))
      solver.models.each_with_index do |model, i|
        ActiveRecord::Base.transaction do
          timetable = Timetable.new
          timetable.id = i
          timetable.costs = model.costs
          model.extract(Timetable::Entry).each do |entry|
            entry.timetable_id = timetable.id
            entry.save!
          end
          timetable.save!
        end
      end
    else
      raise "ASP solving raised errors!"
    end
  end


end
