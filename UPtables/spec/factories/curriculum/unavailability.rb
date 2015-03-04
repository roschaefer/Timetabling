FactoryGirl.define do
  factory :curriculum_unavailability, :class => Curriculum::Unavailability do
    association :curriculum
    association :timeframe
    association :weekday
  end
end
