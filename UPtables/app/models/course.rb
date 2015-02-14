class Course < ActiveRecord::Base
  belongs_to :teacher
  def to_fact
    dl = (double_lecture && "1") || "0"
    "course(\"#{name}\",#{teacher_id},#{dates},#{minimum_working_days},#{participants},#{dl})."
  end
end
