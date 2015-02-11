class Teacher < ActiveRecord::Base
  has_many :unavailabilities, dependent: :destroy
end
