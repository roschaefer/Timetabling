class CourseComponent < ActiveRecord::Base
  
  TYPES = ['Lecture', 'Exercise', 'Project']
  
  belongs_to :teacher
  belongs_to :course
  
  validates :dates, :numericality => { :greater_than => 0}
  validates  :course, :teacher, :dates,  presence: true
  validates  :type, inclusion: { in: TYPES }
  
  self.inheritance_column = nil
end
