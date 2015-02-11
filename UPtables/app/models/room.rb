class Room < ActiveRecord::Base
  has_many :unavailabilities
  validates :name, presence: true


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
