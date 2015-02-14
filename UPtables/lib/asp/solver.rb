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

    # TODO: try not to use Tempfile
    t = Tempfile.new("asp_solving_temp")
    begin
      t.write(problem)
      t.rewind
      cmd = "#{GROUNDER} #{t.path}"

      #File.open("script/debug.lp", 'w') { |file| file.write(problem) }

      grounded_program, stderr_str, status = Open3.capture3(cmd)
      status.success? or return

      Open3.popen3(SOLVER, *SOLVER_OPTS) do |stdin, stdout, stderr, wait_thr|
        stdin.puts grounded_program
        stdin.close
        json = JSON.parse(stdout.read)
        witnesses = json["Call"][0]["Witnesses"]
        witnesses.each do |w|
          @models << Asp::Model.new(w)
        end
      end
    ensure
    t.close
    t.unlink
    end
    true
  end


end
