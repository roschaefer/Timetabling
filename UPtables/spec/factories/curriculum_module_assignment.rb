FactoryGirl.define do
  factory :curriculum_module_assignment do
    mandatory   false
    association :ects_module
    association :curriculum
  end
end
