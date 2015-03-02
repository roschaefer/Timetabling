FactoryGirl.define do
  factory :teacher_unavailability, :class => Teacher::Unavailability do
    association :teacher
    association :timeframe
    association :weekday
  end
end
