class Course < ActiveRecord::Base
  validates :dates, :numericality => { :greater_than => 0}
  belongs_to :teacher
  has_and_belongs_to_many :ects_modules
  has_many :curricula, :through => :ects_modules

  def self.to_fact
    "courses(#{count})."
  end

  def to_fact
    dl = (double_lecture && "1") || "0"
    "course(#{id},#{teacher_id},#{dates},#{minimum_working_days},#{participants},#{dl})."
  end
end
