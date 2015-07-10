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
    problem.post_processing do |solution, element|
      if element.respond_to?(:assign_reference)
        solution.find {|e| element.assign_reference(e) }
      end
    end
    @models = problem.solutions
  end


end
