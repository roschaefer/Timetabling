class Curriculum::Unavailability < ActiveRecord::Base
  include Asp::Element
  validates :curriculum, :weekday, :timeframe, presence: true
  belongs_to :weekday
  belongs_to :timeframe
  belongs_to :curriculum

  def asp_representation
    "curriculum_unavailable(#{curriculum.g_id}, #{weekday.g_id}, #{timeframe.g_id})."
  end
end
