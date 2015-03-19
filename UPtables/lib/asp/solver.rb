require 'open3'

class Asp::Solver
  attr_reader :models
  attr_accessor :time_out, :optimize
  alias_method :optimize?, :optimize

  GROUNDER    = "gringo"
  SOLVER      = "clasp"
  SOLVER_OPTS = ["0", "--outf=2","--quiet=0"]

  def initialize(opts = {:optimize => true})
    @models = []
    @optimize = opts[:optimize] # default: true
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

      if optimize?
        options << "--opt-mode=optN"
      else
        options << "--opt-mode=ignore"
      end

      Open3.popen3(SOLVER, *options) do |stdin, stdout, stderr, wait_thr|
        stdin.puts grounded_program
        stdin.close
        json = JSON.parse(stdout.read)
        witnesses = json["Call"][0]["Witnesses"]
        witnesses.present? and witnesses.each do |w|
          @models << Asp::Model.new(w)
        end
        if (optimize? && @models.present?)
          # TODO: is this a proper fallback?
          if (json["Models"]["Optimal"])
            n = json["Models"]["Optimal"]
            optimals = @models.last(n)
            optimals.each {|o| o.optimum = true }
          end
        end
      end
    ensure
    t.close
    t.unlink
    end
    true
  end


end
