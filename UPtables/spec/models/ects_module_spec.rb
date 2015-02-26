require 'rails_helper'

RSpec.describe EctsModule, type: :model do
  let(:ects_module) { create :ects_module }
  describe "#update" do
    it "updates many to many association on courses" do
      create :course, :id => 3
      create :course, :id => 7
      ects_module.update(:course_ids => [3, 7])
      expect(ects_module.courses).to have(2).items
    end
  end
end
