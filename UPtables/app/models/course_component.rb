class CourseComponent < ActiveRecord::Base
  
  TYPES = ['Vorlesung', 'Übung', 'Seminar', 'Projekt']
  
  belongs_to :teacher
  belongs_to :course
  
  validates :dates, :minimum_working_days, :numericality => { :greater_than => 0}
  validates  :course, :teacher, :dates,  presence: true
  validates  :type, inclusion: { in: TYPES }
  
  self.inheritance_column = nil
  
  def to_fact
    dl = (double_lecture && "1") || "0"
    "course_component(#{id},#{course_id},#{type},#{teacher_id},#{dates},#{minimum_working_days},#{dl})."
  end
  
end
