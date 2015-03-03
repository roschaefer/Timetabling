class EctsModule < ActiveRecord::Base
  has_and_belongs_to_many :courses
  has_many :curriculum_ects_module_joins
  has_many :curricula, :through => :curriculum_ects_module_joins

  validates :name, :presence => true
end
