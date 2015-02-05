class TimetableEntry < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :room
end
