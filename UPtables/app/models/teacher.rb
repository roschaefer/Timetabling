class Teacher < ActiveRecord::Base
  has_many :unavailabilities
end
