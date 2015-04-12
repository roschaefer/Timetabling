class Timetable < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  has_many :committee_dates, dependent: :destroy
  scope :optimal, -> { includes(:entries).where(:optimum => true) }
end
