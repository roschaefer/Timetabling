require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { create :room, :id => 1, :name => "Raum 01", :capacity => 42 }

  describe "#to_fact" do
    it "should encode its state to an ASP fact" do
      expect(room.to_fact).to eq("room(room_1, 42, \"Building\").")
    end
  end


  describe "#unavailable_at!" do
    let(:monday) { create :weekday, :id => 0}
    let(:eleven) { create :timeframe, :id => 1}

    it "creates a new Unavailability" do
      expect{
        room.unavailable_at! monday, eleven
      }.to change{Room::Unavailability.count}.from(0).to(1)
    end

    it "will be unavailable at a certain time" do
      room.unavailable_at! monday, eleven
      expect(room.unavailabilities.first.weekday).to eq monday
      expect(room.unavailabilities.first.timeframe).to eq eleven
    end

    it "doesn't create duplicates" do
      room.unavailable_at! monday, eleven
      expect{
        room.unavailable_at! monday, eleven
      }.not_to change{Room::Unavailability.count}
    end
  end


  describe "#available_at!" do
    let(:monday) { create :weekday, :id => 0}
    let(:eleven) { create :timeframe, :id => 1}

    
    
    
    it "deletes an Unavailability at this time" do
      create :room_unavailability, :room => room, :weekday => monday,  :timeframe => eleven 
      expect{
        room.available_at! monday, eleven
      }.to change{Room::Unavailability.count}.from(1).to(0)
    end
  end

  describe "#update_unavailabilities" do
    it "bulk inserts unavailabilities" do
      create :weekday, :id =>1
      create :weekday, :id =>2
      create :timeframe, :id =>2
      create :timeframe, :id =>3
      create :timeframe, :id =>4
      expect {
        room.update_unavailabilities(["1 2","2 3","2 4"])
      }.to change{Room::Unavailability.count}.from(0).to(3)
    end

    it "no unavailabilities are created for nil" do
      create :weekday, :id =>1
      create :timeframe, :id =>3
      expect {
        room.update_unavailabilities(nil)
      }.not_to raise_exception
      
    end
  end

end
