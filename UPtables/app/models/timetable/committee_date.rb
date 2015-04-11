class Timetable::CommitteeDate < ActiveRecord::Base
  belongs_to :weekday
  belongs_to :timeframe
  belongs_to :timetable
end
