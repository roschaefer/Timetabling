class Curriculum < ActiveRecord::Base
  has_and_belongs_to_many :ects_modules
  def self.to_fact
    "curricula(#{count})."
  end
end
