FactoryGirl.define do
  factory :room_unavailability, :class => Room::Unavailability do
    association :room, factory: :room
    association :timeframe, factory: :timeframe
    association :weekday, factory: :weekday
  end
end
