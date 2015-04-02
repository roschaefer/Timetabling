require 'rails_helper'

RSpec.describe Course::Component, type: :model do
  describe "#participants" do
    it "must be greater than zero" do
      expect(build(:course_component, :participants => 0)).not_to be_valid
    end
  end
end
