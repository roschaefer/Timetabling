require 'open3'

class Asp::Solver
  attr_reader :models
  attr_accessor :time_out

  GROUNDER    = "gringo"
  SOLVER      = "clasp"
  SOLVER_OPTS = ["0", "--outf=2","--quiet=0","--verbose=0"]

  def initialize
    @models = []
  end

  def solve(problem)

    # TODO: try not to use Tempfile
    t = Tempfile.new("asp_solving_temp")
    begin
      t.write(problem)
      t.rewind
      cmd = "#{GROUNDER} #{t.path}"


      grounded_program, stderr_str, status = Open3.capture3(cmd)
      status.success? or return

      options = []
      options.push(* SOLVER_OPTS)
      if @time_out
        options << "--time-limit=#{@time_out}"
      end

      Open3.popen3(SOLVER, *options) do |stdin, stdout, stderr, wait_thr|
        stdin.puts grounded_program
        stdin.close
        json = JSON.parse(stdout.read)
        witnesses = json["Call"][0]["Witnesses"]
        witnesses.present? and witnesses.each do |w|
          @models << Asp::Model.new(w)
        end
        if @models.present?
          @models.last.optimum = (json["Result"] == "OPTIMUM FOUND")
        end
      end
    ensure
    t.close
    t.unlink
    end
    true
  end


end
