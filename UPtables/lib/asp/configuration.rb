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

  if optimize?
    encoding += "\n#minimize {P,N,V : penalty(N,V,P)}.\n"
  end
  encoding
end

end
