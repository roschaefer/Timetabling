require 'rails_helper'

RSpec.describe CurriculumModuleAssignment, type: :model do
  let(:cma) { create :curriculum_module_assignment }
  
  context "validations" do 
    it "is invalid without a module" do
      cma.ects_module = nil
      expect(cma).not_to be_valid
    end
  end

  
end