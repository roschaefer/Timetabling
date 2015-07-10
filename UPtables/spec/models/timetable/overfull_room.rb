require 'rails_helper'
describe Timetable::OverfullRoom do
  describe "#match?" do
    it { expect( Timetable::OverfullRoom.match?("penalty(\"RoomCapacity\",assigned(course_component_1,room_1,weekday_1,timeframe_1),90)")).to be_truthy }
    it { expect( Timetable::OverfullRoom.match?("assigned(course_component_1,room_1,weekday_1,timeframe_1)")).to be_falsey }
  end

  describe "#option_hash" do
    it do
      string = "penalty(\"RoomCapacity\",assigned(course_component_1,room_1,weekday_1,timeframe_1),90)"
      expected_attributes =  {Timetable::Entry => {:course_component_id => "1", :room_id => "1", :weekday_id => "1", :timeframe_id => "1"}, :severity => "90"}
      expect(Timetable::OverfullRoom.option_hash(string)).to eq expected_attributes 
    end
  end

  describe "#from" do
    it do
      string = "penalty(\"RoomCapacity\",assigned(course_component_1,room_1,weekday_1,timeframe_1),90)"
      overfull = Timetable::OverfullRoom.from(string)
      expect(overfull.severity).to eq 90
    end
  end

end 
