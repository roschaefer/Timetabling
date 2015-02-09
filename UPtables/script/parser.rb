require 'open3'
require 'json'
cmd = "gringo ./script/facts.lp ./script/timetabling.lp | clasp --outf=2 --quiet=0 --verbose=0"


def parse_assigned(assigned_string)
  elements = assigned_string.scan(/assigned\((.*),(.*),(.*),(.*)\)/)
  Hash[[:course, :room, :day, :time].zip(*elements)]
end


def parse(output)
  json = JSON.parse(output)
  witnesses = json["Call"][0]["Witnesses"]
  ActiveRecord::Base.transaction do
    witnesses.each_with_index do |w, i|
      timetable = Timetable.new
      timetable.id = i
      timetable.costs = w["Costs"][0]
      w["Value"].each do |v| 
        assigned_hash = parse_assigned(v)
        entry = Timetable::Entry.new
        entry.timetable_id = timetable.id
        entry.course       = assigned_hash[:course]
        entry.room_id      = assigned_hash[:room]
        entry.weekday_id   = assigned_hash[:day]
        entry.timeframe_id = assigned_hash[:time]
        entry.save!
      end
      timetable.save!
    end
  end
end


Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
  parse(stdout.read) 
end
