FactoryGirl.define do
  factory :course do
      name                 "Informatik für Naturwissenschaften"
      association          :teacher
      
  end
  factory :course_with_curriculum, parent: :course do
    transient do
      curriculum  { create :curriculum }
    end

    after(:create) do |course, evaluator|
      curriculum = evaluator.curriculum
      ects_module = create(:ects_module)
      curriculum.ects_modules << ects_module
      course.ects_modules << ects_module 
    end
  end
  factory :course_with_component, parent: :course do
    transient do
      components_count 1
    end
    after(:create) do |course, evaluator|
      create_list(:course_components, evaluator.components_count, course: course)
    end
  end
end
  
