class Course < ActiveRecord::Base
  validates :dates, :numericality => { :greater_than => 0}
  belongs_to :teacher

  def self.to_fact
    "courses(#{count})."
  end

  def to_fact
    dl = (double_lecture && "1") || "0"
    "course(#{id},#{teacher_id},#{dates},#{minimum_working_days},#{participants},#{dl})."
  end
end
