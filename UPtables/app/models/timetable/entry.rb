class Timetable::Entry < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :course
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe
  has_one :overfull_room

  def self.asp_attributes
    [:course_id, :room_id, :weekday_id, :timeframe_id]
  end

  def self.asp_regex
    part = self.asp_attributes.map{|a| "(.*)" }.join(",")
    /assigned\(#{part}\)/
  end

  def self.from_asp(elements)
    new(Hash[[:course_id, :room_id, :weekday_id, :timeframe_id].zip(*elements)])
  end

end
