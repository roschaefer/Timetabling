class Room < ActiveRecord::Base
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

  def available_at?(weekday, timeframe)
    weekday   = weekday.id   if weekday.respond_to? :id
    timeframe = timeframe.id if timeframe.respond_to? :id
    not unavailabilities.any? {|u| (u.weekday_id == weekday) && (u.timeframe_id == timeframe) }
  end


  def update_unavailabilities(params)
    ActiveRecord::Base.transaction do
      Weekday.all.each do |weekday|
        Timeframe.all.each do |timeframe|
          if params and params[weekday.id.to_s] and params[weekday.id.to_s][timeframe.id.to_s] then
            unavailable_at! weekday, timeframe
          else
            available_at! weekday, timeframe
          end
        end
      end
    end
    true
  end

end
