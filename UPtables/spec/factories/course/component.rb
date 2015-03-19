FactoryGirl.define do
  factory :course_component, :class => Course::Component do
    association          :teacher
    association          :course
    type                 'Vorlesung'
    dates                1
    double_lecture       false
    minimum_working_days 1
  end
end
