class Curriculum < ActiveRecord::Base
  has_many :curriculum_ects_module_joins
  has_many :ects_modules, :through => :curriculum_ects_module_joins

  validates :name, :presence => true

  def self.to_fact
    "curricula(#{count})."
  end
end
