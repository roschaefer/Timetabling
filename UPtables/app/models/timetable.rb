class Timetable < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  scope :optimal, -> { where(:optimum => true) }
end
