class Curriculum < ActiveRecord::Base
  include HasUnavailabilities
  
  has_many :unavailabilities, dependent: :destroy
  has_many :curriculum_module_assignments
  has_many :ects_modules, through: :curriculum_module_assignments
  
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
  
  def mandatory_modules
   curriculum_module_assignments.where(mandatory:true).collect{|a| a.ects_module }
  end
  
  def selectable_modules
    curriculum_module_assignments.where(mandatory:nil).collect{|a| a.ects_module }
  end
  
  def assign_mandatory_modules()
  
  end

  
  def assing_selectable_modules()
  
  end
  
end
