class Room::Property < ActiveRecord::Base
  include Asp::Element
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :course_components, :class_name => 'Course::Component'

  def asp_representation
    rooms_without_this_property = (Room.all - rooms)
    facts = []
    course_components.each do |component|
      rooms_without_this_property.each do |room|
        facts << "room_unsuitable(#{room.g_id},#{component.g_id})."
      end
    end
    facts.join("\n")
  end
end
