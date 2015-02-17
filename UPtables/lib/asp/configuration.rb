class Asp::Configuration
attr_accessor :optimize

def self.default
  constraints = Asp::Constraint::HARD_CONSTRAINTS + Asp::Constraint::SOFT_CONSTRAINTS
  new(*constraints)
end

def self.only_hard_constraints
  constraints = Asp::Constraint::HARD_CONSTRAINTS
  i = new(*constraints)
  i.optimize = false
  i
end

def optimize?
  @optimize
end

def initialize(*constraints)
  @constraints = constraints.collect {|c| Asp::Constraint.send(c) }
  @optimize = true
end


def asp_rule_encoding
  encoding = ""
  encoding += IO.read(File.join("lib","asp","constraints","basic_structure.lp"))
  encoding += "\n"

  @constraints.each do |constraint|
    encoding += constraint.to_asp
    encoding += "\n"
  end

  # TODO: refactor
  if optimize?
    encoding << %{
#const penalty_of_room_capacity = 1.
#const penalty_of_min_working_days = 5.
#const penalty_of_isolated_lectures = 1.

#minimize {P,N,V : penalty(N,V,P)}.
}
  end
  encoding
end

end
