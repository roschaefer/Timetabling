class Curriculum::Unavailability < ActiveRecord::Base
  validates :curriculum, :weekday, :timeframe, presence: true
  belongs_to :weekday
  belongs_to :timeframe
  belongs_to :curriculum

  def to_fact
    "curriculum_unavailable(#{curriculum_id}, #{weekday_id}, #{timeframe_id})."
  end
end
