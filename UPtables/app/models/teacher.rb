class Teacher < ActiveRecord::Base
  has_many :unavailabilities, dependent: :destroy

  def full_name
    "#{first_name} #{surname}"
  end
end
