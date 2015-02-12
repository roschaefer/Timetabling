class Course < ActiveRecord::Base
  belongs_to :teacher
  def to_fact
    ""

  end
end
