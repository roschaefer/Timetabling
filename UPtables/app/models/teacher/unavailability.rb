class Teacher::Unavailability < ActiveRecord::Base
  
  validates :teacher, :weekday, :timeframe, presence: true
  
  belongs_to :teacher
  belongs_to :weekday
  belongs_to :timeframe

  def to_fact
    "professor_unavailable(#{teacher.g_id},#{weekday.g_id},#{timeframe.g_id})."
  end
end
