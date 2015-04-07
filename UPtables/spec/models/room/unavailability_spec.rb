require 'rails_helper'

RSpec.describe Room::Unavailability, type: :model do
  describe "#to_fact" do
    it "should encode its state to an ASP fact" do
      room = create :room, :id => 1 
      tuesday = create :weekday, :id => 2, :name => "Tuesday"
      noon = create :timeframe, :id => 4 , :interval => "12:00 - 14:00"
      unavailability = create :room_unavailability, :room => room, :weekday => tuesday, :timeframe => noon
      expect(unavailability.to_fact).to eq("room_unavailable(room_1, weekday_2, timeframe_4).")
    end
  end
end
