class Course::Component < ActiveRecord::Base
  
  TYPES = ['Vorlesung', 'Übung', 'Seminar', 'Projekt']
  
  belongs_to :teacher
  belongs_to :course
  
  validates :dates, :minimum_working_days, :numericality => { :greater_than => 0}
  validates  :course, :teacher, :dates,  presence: true
  validates  :type, inclusion: { in: TYPES }
  validates  :participants,  presence: true
  
  self.inheritance_column = nil
  
  def to_fact
    dl = (double_lecture && "1") || "0"
    facts = []
    facts << "course_component(#{id},#{teacher_id},#{dates},#{minimum_working_days},#{participants},#{dl})."
    facts << "has_component(#{course_id},#{id})."
    facts.join("\n")
  end
  
end
