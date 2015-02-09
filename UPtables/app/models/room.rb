class Room < ActiveRecord::Base
  has_many :unavailabilities
  validates :name, presence: true


  def to_fact
    "room(#{id}, #{capacity}, \"Building\")."
  end
end
