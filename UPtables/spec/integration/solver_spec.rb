describe Asp::Problem do
  describe "#models" do
    context "for a given ASP encoding" do

      it "with one fact yields one stable model" do
        problem = Asp::Problem.new "this."
        expect(problem.solutions).to have(1).item
      end

      it "with a decision rule yields two stable models" do
        problem = Asp::Problem.new "a:- not b. b:- not a."
        expect(problem.solutions).to have(2).items
      end

      it "with invalid syntax raises exception" do
        problem = Asp::Problem.new "this" 
        expect{problem.solutions}.to raise_exception(Asp::Solving::InvalidSyntaxException)
      end

    end
  end
end
