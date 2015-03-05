FactoryGirl.define do
  factory :curriculum do
    
    name "Informatik Bachelor"
    
    factory :curriculum_with_curriculum_module_assignments do
      
      transient do
        curriculum_module_assignments_count 3
      end
              
      after(:create) do |curriculum, evaluator|
        create_list(:curriculum_module_assignment, evaluator.curriculum_module_assignments_count, curriculum: curriculum)
      end
    
    end
  end
end
