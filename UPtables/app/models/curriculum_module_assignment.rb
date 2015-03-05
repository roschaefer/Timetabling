class CurriculumModuleAssignment < ActiveRecord::Base
  belongs_to :ects_module
  belongs_to :curriculum
  
  validates :ects_module, :curriculum, :presence => true #:mandatory,
  
end
