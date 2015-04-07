class TimeWindow < ActiveRecord::Base
  belongs_to :timeframe
  belongs_to :weekday
  belongs_to :curriculum
  
  validates :timeframe, :weekday, :curriculum, :presence => true
  
  def to_fact
    "time_window(#{timeframe.g_id}, #{weekday.g_id}, #{curriculum.g_id}, #{semester})."
  end
  
end
