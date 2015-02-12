describe Asp::Solver do
  subject(:solver) { Asp::Solver.new }
  describe "#solve" do
    context "for a given ASP encoding" do

      it "with one fact yields one stable model" do
        solver.solve "this."
        expect(solver.models).to have(1).item
      end

      it "with a decision rule yields two stable models" do
        solver.solve "a:- not b. b:- not a."
        expect(solver.models).to have(2).item
      end

      it "with invalid syntax yields no stable models" do
        solver.solve "this"
        expect(solver.models).to be_empty
      end
    end
  end
end
