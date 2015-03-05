require 'rails_helper'

RSpec.describe Curriculum, type: :model do
  
  let(:curriculum) { create :curriculum_with_curriculum_module_assignments, :curriculum_module_assignments_count => 3 }
  
  subject(:assign1){ curriculum.curriculum_module_assignments.first  }
  subject(:assign2){ curriculum.curriculum_module_assignments.second }
  subject(:assign3){ curriculum.curriculum_module_assignments.third  }
  
  subject(:mod1){ assign1.ects_module }
  subject(:mod2){ assign2.ects_module }
  subject(:mod3){ assign3.ects_module }
  
  describe "ects_module related methods" do 
   
    before(:each) do 
      assign1.mandatory = true
      assign1.save      
    end
       
    describe "#mandatory_modules" do
      it "lists all mandatory modules" do  
        expect(curriculum.mandatory_modules).to match_array([mod1])
      end
    end
    
    describe "#selectable_modules" do
      it "lists all selectable modules" do 
        expect(curriculum.selectable_modules).to match_array([mod2,mod3])
      end
    end
    
    describe "#assign_ects_modules" do
      context "valid params hash" do
        it "switches existing assignments to mandatory/selectable" do
          params = { :selectable_modules => [mod1.id], :mandatory_modules => [mod2.id,mod3.id] }
          curriculum.assign_ects_modules(params)
          expect(curriculum.mandatory_modules).to  match_array([mod2,mod3])
          expect(curriculum.selectable_modules).to match_array([mod1])
        end
        
        it "deletes existing assignments" do
          params = { :selectable_modules => [mod2.id], :mandatory_modules => [] }
          curriculum.assign_ects_modules(params)
          expect(curriculum.selectable_modules).to match_array([mod2])
          expect(curriculum.mandatory_modules).to  match_array([])
        end
        
        it "adds assingments that are not already present" do 
          mod4 = create :ects_module
          mod5 = create :ects_module
          params = { :selectable_modules => [mod4.id], :mandatory_modules => [mod2.id,mod5.id] }
          curriculum.assign_ects_modules(params)
          expect(curriculum.selectable_modules).to match_array([mod4])
          expect(curriculum.mandatory_modules).to  match_array([mod2,mod5])
        end
        
        it "adds/deletes assignments and ignores blank values" do 
          mod4 = create :ects_module
          mod5 = create :ects_module
          params = { :selectable_modules => ["",mod4.id], :mandatory_modules => ["",mod2.id,mod5.id] }
          curriculum.assign_ects_modules(params)
          expect(curriculum.selectable_modules).to match_array([mod4])
          expect(curriculum.mandatory_modules).to  match_array([mod2,mod5])
        end
      end
      
      context "invalid params hash" do
        it "doesn't change any assignments if intersection of selectable and mandatory modules is not empty" do 
          mod4 = create :ects_module
          params = { :selectable_modules => ["",mod4.id], :mandatory_modules => ["",mod2.id, mod4.id] }
          curriculum.assign_ects_modules(params)
          expect(curriculum.selectable_modules).to match_array([mod2,mod3])
          expect(curriculum.mandatory_modules).to  match_array([mod1])
        end
      end
  
    end
  end 

end
