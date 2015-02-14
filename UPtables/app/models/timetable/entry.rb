class Timetable::Entry < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :course
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe

  def self.asp_label
    "assigned"
  end

  def self.asp_attributes
    [:course_id, :room_id, :weekday_id, :timeframe_id]
  end
end
