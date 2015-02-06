class Timetable::Entry < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :room
  belongs_to :weekday
  belongs_to :timeframe
end
