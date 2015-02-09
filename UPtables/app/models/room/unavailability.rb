class Room::Unavailability < ActiveRecord::Base
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe
end
