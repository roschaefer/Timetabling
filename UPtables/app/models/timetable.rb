class Timetable < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  scope :optimal, -> { includes(:entries).where(:optimum => true) }
end
