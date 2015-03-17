require 'rails_helper'

RSpec.describe Room::Property, type: :model do
  context "class methods", :pending => "For some reason, test environment doesn't seed the database during migrations" do
    describe "::beamer" do
      it "exists" do
        expect(Room::Property.beamer).not_to be_nil
      end
    end

    describe "::computer" do
      it "exists" do
        expect(Room::Property.computer).not_to be_nil
      end
    end
  end
end
