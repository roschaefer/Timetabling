describe Asp::Model do
  describe "#extract" do
    let(:model_hash) { {"Value" => ["assigned(3,2,4,1)"]} }
    subject(:model) { Asp::Model.new(model_hash) }

    it "extracts ruby objects" do
      expect(model.extract Timetable::Entry ).to have(1).item
    end

    it "extracts timetable entries and assignes attributes" do
      entry = model.extract(Timetable::Entry).first
      expect(entry.course).to eq "3"
      expect(entry.room_id).to eq 2
      expect(entry.weekday_id).to eq 4
      expect(entry.timeframe_id).to eq 1
    end
  end
end
