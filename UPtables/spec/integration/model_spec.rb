describe Asp::Model do
  describe "#extract" do
    let(:model_hash) { {"Costs" => 5, "Value" => ["assigned(3,2,4,1)"]} }
    subject(:model) { Asp::Model.new(model_hash) }

    it "parses the costs" do
      expect(model.costs ).to eq 5
    end

    it "extracts ruby objects" do
      expect(model.extract Timetable::Entry ).to have(1).item
    end

    it "extracts timetable entries and assignes attributes" do
      entry = model.extract(Timetable::Entry).first
      expect(entry.course_id).to eq 3
      expect(entry.room_id).to eq 2
      expect(entry.weekday_id).to eq 4
      expect(entry.timeframe_id).to eq 1
    end


    context "for unsatisfiable problems" do
      let(:model_hash) { { } }

      it "extracts nothing" do
        expect(model.extract(Timetable::Entry)).to be_empty
      end
    end
  end
end
