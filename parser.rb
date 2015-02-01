require './asp'
cmd = "/home/robert/Documents/2014_Potsdam/AnswerSetSolving/BigProject/gringo3/gringo-3.0.5-source/build/bin/gringo facts.lp timetabling.lp | clasp --outf=2 --quiet=0 --verbose=0"


def parse_assigned(assigned_string)
  elements = assigned_string.scan(/assigned\((.*),(.*),(.*),(.*)\)/)
  Hash[[:course, :room, :day, :time].zip(*elements)]
end


def parse(output)
json = JSON.parse(output)
models = []
witnesses = json["Call"][0]["Witnesses"]
witnesses.each_with_index do |w, i|
  cost = w["Costs"][0]
  w["Value"].each do |v| 
    assigned_hash = parse_assigned(v)
    assigned = Assigned.new
    assigned.cost = cost
    assigned.solution = i
    assigned.course = assigned_hash[:course]
    assigned.room   = assigned_hash[:room]
    assigned.day    = assigned_hash[:day]
    assigned.time   = assigned_hash[:time]
    assigned.save!
  end
end
models
end


Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
  puts parse(stdout.read) 
end

