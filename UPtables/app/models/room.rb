class Room < ActiveRecord::Base
  include HasUnavailabilities
  has_many :unavailabilities, dependent: :destroy
  validates :name, presence: true
  validates :capacity, :numericality => { :greater_than_or_equal_to => 0 }


  def self.to_fact
    "rooms(#{count})."
  end

  def to_fact
    "room(#{id}, #{capacity}, \"Building\")."
  end


  def available_at!(weekday, timeframe)
    Room::Unavailability.where(:room => self, :weekday => weekday, :timeframe => timeframe).destroy_all
  end

  def unavailable_at!(weekday, timeframe)
    Room::Unavailability.where(:room => self, :weekday => weekday, :timeframe => timeframe).first_or_create
  end

end
