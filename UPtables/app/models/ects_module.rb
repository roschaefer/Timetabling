class EctsModule < ActiveRecord::Base
  has_and_belongs_to_many :courses
  
  has_many :curriculum_module_assignments, dependent: :destroy
  has_many :curricula, through: :curriculum_module_assignments

  validates :name, :presence => true
end
