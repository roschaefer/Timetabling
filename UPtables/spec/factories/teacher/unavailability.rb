FactoryGirl.define do
  factory :teacher_unavailability, :class => Teacher::Unavailability do
    association :teacher, factory: :teacher
    association :timeframe, factory: :timeframe
    association :weekday, factory: :weekday
  end
end
