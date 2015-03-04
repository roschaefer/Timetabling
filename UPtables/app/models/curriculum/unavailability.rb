class Curriculum::Unavailability < ActiveRecord::Base
  validates :curriculum, :weekday, :timeframe, presence: true
  belongs_to :weekday
  belongs_to :timeframe
  belongs_to :curriculum
end
