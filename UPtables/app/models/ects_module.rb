class EctsModule < ActiveRecord::Base
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :curricula

  validates :name, :presence => true
end
