class Room::Unavailability < ActiveRecord::Base
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe

  def to_fact
    "room_unavailability(#{room.id}, #{weekday.id}, #{timeframe.id})."
  end
end
