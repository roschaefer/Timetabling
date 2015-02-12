require 'open3'

class Asp::Solver
  attr_reader :models

  GROUNDER    = "gringo"
  SOLVER      = "clasp"
  SOLVER_OPTS = ["0", "--outf=2","--quiet=0","--verbose=0"]

  def initialize
    @models = []
  end

  def solve(problem)
    @problem = "\"#{problem}\""

    # TODO: proper pipelining here
    cmd = "echo #{@problem} | #{GROUNDER}"


    stdout_str, stderr_str, status = Open3.capture3(cmd)
    status.success? or return

    Open3.pipeline_r(["echo", stdout_str], [SOLVER, *SOLVER_OPTS]) do |stdout, wait_thr|
      json = JSON.parse(stdout.read)
      witnesses = json["Call"][0]["Witnesses"]
      witnesses.each do |w|
       @models << Asp::Model.new(w)
      end
    end
  end


end
