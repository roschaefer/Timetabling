FactoryGirl.define do
  factory :course_component, :class => Course::Component do
    association          :teacher
    association          :course
    type                 :lecture
    dates                1
    double_lecture       false
    participants         20
  end
end
