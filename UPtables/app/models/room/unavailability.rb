class Room::Unavailability < ActiveRecord::Base
  include Asp::Element
  asp_schema :room_id, :weekday_id, :timeframe_id

  validates :room, :weekday, :timeframe, presence: true
  
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe

  def self.asp_predicate_basename
    "room_unavailability"
  end

  def asp_representation
    "room_unavailable(#{room.g_id}, #{weekday.g_id}, #{timeframe.g_id})."
  end
end
