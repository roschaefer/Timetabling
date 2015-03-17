class Room::Property < ActiveRecord::Base
  BEAMER   = 1
  COMPUTER = 2

  def self.beamer
    find(BEAMER)
  end

  def self.computer
    find(COMPUTER)
  end

  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :courses
end
