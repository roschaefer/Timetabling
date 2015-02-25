class Timetable::Entry < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :course
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe

  def self.asp_regex
    /assigned\((.*),(.*),(.*),(.*)\)/
  end

  def self.from_asp(elements)
    new(Hash[[:course_id, :room_id, :weekday_id, :timeframe_id].zip(*elements)])
  end
end
