
def concat_encoding
  facts = IO.read("./script/facts.lp")
  timetabling = IO.read("./script/timetabling.lp")
  new_facts = ""
  [Room, Room::Unavailability].each do |fact_class|
    fact_class.all.each do |fact_instance|
      new_facts += fact_instance.to_fact
      new_facts += "\n"
    end
    new_facts += "\n"
  end
  encoding = new_facts
  encoding += "\n"
  encoding += facts
  encoding += "\n"
  encoding += timetabling
  encoding
end

solver = Asp::Solver.new
if (solver.solve(concat_encoding))
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

