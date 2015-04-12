FactoryGirl.define do
  factory :committee_date, :class => Timetable::CommitteeDate do
    association :timetable
    association :weekday
    association :timeframe
  end
end
