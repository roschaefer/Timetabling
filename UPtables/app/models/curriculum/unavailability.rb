class Curriculum::Unavailability < ActiveRecord::Base
  validates :curriculum, :weekday, :timeframe, presence: true
  belongs_to :weekday
  belongs_to :timeframe
  belongs_to :curriculum

  def to_fact
    "curriculum_unavailable(#{curriculum.g_id}, #{weekday.id}, #{timeframe.id})."
  end
end
