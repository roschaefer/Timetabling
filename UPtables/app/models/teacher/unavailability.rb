class Teacher::Unavailability < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :weekday
  belongs_to :timeframe

  def to_fact
    "professor_unavailable(#{teacher_id},#{weekday_id},#{timeframe_id})."
  end
end
