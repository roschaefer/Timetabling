FactoryGirl.define do
  factory :course do
      name                 "Informatik für Naturwissenschaften"
      association          :teacher
      participants         20
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
end
  
