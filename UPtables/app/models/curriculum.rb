class Curriculum < ActiveRecord::Base
  include HasUnavailabilities
  has_many :curriculum_ects_module_joins
  has_many :ects_modules, :through => :curriculum_ects_module_joins
  has_many :unavailabilities, dependent: :destroy

  validates :name, :presence => true

  def self.to_fact
    "curricula(#{count})."
  end

  def available_at!(weekday_id, timeframe_id)
    Curriculum::Unavailability.where(:curriculum => self, :weekday_id => weekday_id, :timeframe_id => timeframe_id).destroy_all
  end

  def unavailable_at!(weekday_id, timeframe_id)
    Curriculum::Unavailability.where(:curriculum => self, :weekday_id => weekday_id, :timeframe_id => timeframe_id).first_or_create
  end
end
