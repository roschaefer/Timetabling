class Room::Unavailability < ActiveRecord::Base
  
  validates :room, :weekday, :timeframe, presence: true
  
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe

  def to_fact
    "room_unavailable(#{room.g_id}, #{weekday.g_id}, #{timeframe.g_id})."
  end
end
