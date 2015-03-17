class Room::Property < ActiveRecord::Base
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :courses

  def to_fact
    rooms_without_this_property = (Room.all - rooms)
    facts = []
    courses.each do |course|
      rooms_without_this_property.each do |room|
        facts << "room_unsuitable(#{room.id},#{course.id})."
      end
    end
    facts.join("\n")
  end
end
