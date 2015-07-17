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
end


def asp_rule_encoding
  encoding = ""
  encoding += IO.read(Rails.root.join("lib","timetabling","constraints","basic_structure.lp"))
  encoding += "\n"
  encoding += IO.read(Rails.root.join("lib","timetabling","constraints","fake_penalty.lp"))
  encoding += "\n"
  
  @constraints.each do |constraint|
    encoding += constraint.asp_representation
    encoding += "\n"
  end

  encoding
end

end
