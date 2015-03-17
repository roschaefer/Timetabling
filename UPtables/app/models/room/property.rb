class Room::Property < ActiveRecord::Base
  BEAMER   = 1
  COMPUTER = 2

  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :courses
end
