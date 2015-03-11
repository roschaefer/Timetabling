class Asp::Configuration

def self.default
  constraints = Asp::Constraint::HARD_CONSTRAINTS + Asp::Constraint::SOFT_CONSTRAINTS
  new(*constraints)
end

def self.only_hard_constraints
  constraints = Asp::Constraint::HARD_CONSTRAINTS
  new(*constraints)
end

def initialize(*constraints)
  @constraints = constraints.collect {|c| Asp::Constraint.send(c) }
end


def asp_rule_encoding
  encoding = ""
  encoding += IO.read(Rails.root.join("lib","asp","constraints","basic_structure.lp"))
  encoding += "\n"

  @constraints.each do |constraint|
    encoding += constraint.to_asp
    encoding += "\n"
  end

  encoding
end

end
