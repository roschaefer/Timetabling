class Teacher < ActiveRecord::Base
  has_many :unavailabilities, dependent: :destroy
  
  def full_name
    "#{surname} #{name}"
  end

end
