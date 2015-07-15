class Teacher::Unavailability < ActiveRecord::Base
  include Asp::Element
  asp_schema :teacher_id, :weekday_id, :timeframe_id

  validates :teacher, :weekday, :timeframe, presence: true
  
  belongs_to :teacher
  belongs_to :weekday
  belongs_to :timeframe

  def asp_representation
    "professor_unavailable(#{teacher.g_id},#{weekday.g_id},#{timeframe.g_id})."
  end

  def self.asp_predicate_basename
    "professor_unavailable"
  end
end
