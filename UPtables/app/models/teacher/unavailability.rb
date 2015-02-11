class Teacher::Unavailability < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :weekday
  belongs_to :timeframe
end
