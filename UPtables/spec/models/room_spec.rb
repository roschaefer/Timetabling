require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "#to_fact" do
    it "should encode its state to an ASP fact" do
      room = create :room, :id => 1, :name => "Raum 01", :capacity => 42
      expect(room.to_fact).to eq("room(1, 42, \"Building\")")
    end
  end
end
