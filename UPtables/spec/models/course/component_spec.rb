require 'rails_helper'

RSpec.describe Course::Component, type: :model do
  describe "#participants" do
    it "must be greater than zero" do
      expect(build(:course_component, :participants => 0)).not_to be_valid
    end
  end

  describe "#dates" do
    it "must be greater than zero" do
      expect(build(:course_component, :dates => 0)).not_to be_valid
    end
  end

  describe "#double_lecture" do
    it "is invalid for only one date per week" do
      expect(build(:course_component, :double_lecture => true, :dates => 1)).not_to be_valid
    end

    it "is valid for more than one date per week" do
      expect(build(:course_component, :double_lecture => true, :dates => 2)).to be_valid
    end
  end
end
