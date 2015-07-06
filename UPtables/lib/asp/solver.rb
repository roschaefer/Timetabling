
class Asp::Solver

  attr_reader :models
  attr_accessor :time_out, :optimize
  alias_method :optimize?, :optimize

  def initialize(opts = {:optimize => true})
    @models = []
    @optimize = opts[:optimize] # default: true
  end

  def solve(problem_string)
    problem = Asp::Problem.new(problem_string)
    @models = problem.solutions
  end


end
