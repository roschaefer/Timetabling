describe Asp::Solver do
  subject(:solver) { Asp::Solver.new(:optimize => false) }
  describe "#models" do
    subject(:models) {solver.models}
    context "for a given ASP encoding" do

      it "with one fact yields one stable model" do
        solver.solve "this."
        expect(models).to have(1).item
      end

      it "with a decision rule yields two stable models" do
        solver.solve "a:- not b. b:- not a."
        expect(models).to have(2).items
      end

      it "with invalid syntax yields no stable models" do
        solver.solve "this"
        expect(models).to be_empty
      end

    end
  end
end
