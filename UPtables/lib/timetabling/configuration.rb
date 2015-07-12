class Timetabling::Configuration

def self.default
  constraints = Timetabling::Constraint::HARD_CONSTRAINTS + Timetabling::Constraint::SOFT_CONSTRAINTS
  new(*constraints)
end

def self.only_hard_constraints
  constraints = Timetabling::Constraint::HARD_CONSTRAINTS
  new(*constraints)
end

def initialize(*constraints)
  @constraints = constraints.collect {|c| Timetabling::Constraint.send(c) }
  # otherwise, it's hard to write tests
  # we also deactive this constraint in production mode for now
  set("hard/committee_dates", false)
end

def set(key, active)
  @constraints.each do |constraint|
    constraint.active = active if (constraint.key == key)
  end
end


def asp_rule_encoding
  encoding = ""
  encoding += IO.read(Rails.root.join("lib","timetabling","constraints","basic_structure.lp"))
  encoding += "\n"
  encoding += IO.read(Rails.root.join("lib","timetabling","constraints","fake_penalty.lp"))
  encoding += "\n"
  
  @constraints.each do |constraint|
    if (constraint.active?)
      encoding += constraint.to_asp
      encoding += "\n"
    end
  end

  encoding
end

end
