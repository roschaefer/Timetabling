class Room < ActiveRecord::Base
  include Asp::Element
  
  include GlobalId
  include HasUnavailabilities
  
  has_many :unavailabilities, dependent: :destroy
  has_and_belongs_to_many :properties
  validates :name, presence: true
  validates :capacity, :numericality => { :greater_than_or_equal_to => 0 }


  def self.asp_representation
    "rooms(#{count})."
  end

  def asp_representation
    "room(#{g_id}, #{capacity})."
  end


  def available_at!(weekday, timeframe)
    Room::Unavailability.where(:room => self, :weekday => weekday, :timeframe => timeframe).destroy_all
  end

  def unavailable_at!(weekday, timeframe)
    Room::Unavailability.where(:room => self, :weekday => weekday, :timeframe => timeframe).first_or_create
  end

end
