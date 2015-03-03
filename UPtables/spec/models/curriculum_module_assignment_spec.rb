require 'rails_helper'

RSpec.describe CurriculumModuleAssignment, type: :model do
  let(:cma) { FactoryGirl.create :curriculum_module_assingment }
  
  context "validations" do 
    it "is invalid without a course" do
      cma.course_id = nil
      expect(cma).not_to be_valid
    end
  end

  
end