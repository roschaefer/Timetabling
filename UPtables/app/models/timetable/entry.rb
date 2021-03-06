class Timetable::Entry < ActiveRecord::Base
  include Asp::Element
  asp_schema :course_component_id, :room_id, :weekday_id, :timeframe_id

  belongs_to :timetable
  belongs_to :course_component, :class_name => 'Course::Component'
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe
  has_one :overfull_room

  def self.asp_predicate_basename
    "assigned"
  end

  def self.asp_regex
    part = self.asp_attributes.map{|a| "(?:\\D*)(?<#{a}>\\d+)" }.join(",")
    /assigned\(#{part}\)/
  end

  def asp_initialize(opts={})
    self.attributes = opts
  end

end
