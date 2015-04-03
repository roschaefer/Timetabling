class Teacher < ActiveRecord::Base
  
  include GlobalId
  include HasUnavailabilities
  
  has_many :unavailabilities, dependent: :destroy

  def full_name
    "#{first_name} #{surname}"
  end

  def available_at!(weekday_id, timeframe_id)
    Teacher::Unavailability.where(:teacher => self, :weekday_id => weekday_id, :timeframe_id => timeframe_id).destroy_all
  end

  def unavailable_at!(weekday_id, timeframe_id)
    Teacher::Unavailability.where(:teacher => self, :weekday_id => weekday_id, :timeframe_id => timeframe_id).first_or_create
  end

end
