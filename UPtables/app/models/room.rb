class Room < ActiveRecord::Base
  has_many :unavailabilities
  validates :name, presence: true
end
