class CurriculumEctsModuleJoin < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :ects_module
end
