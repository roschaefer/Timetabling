class Room::Property < ActiveRecord::Base
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :courses

  BEAMER   = 1
  COMPUTER = 2

  def self.beamer
    find(BEAMER)
  end

  def self.computer
    find(COMPUTER)
  end

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
