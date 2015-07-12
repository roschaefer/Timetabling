class TimeWindow < ActiveRecord::Base
  include Asp::Element
  belongs_to :timeframe
  belongs_to :weekday
  belongs_to :curriculum
  
  validates :timeframe, :weekday, :curriculum, :presence => true
  
  def asp_representation
    "time_window(#{weekday.g_id}, #{timeframe.g_id}, #{curriculum.g_id}, #{semester})."
  end
  
end
