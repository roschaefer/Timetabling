class Course::Component < ActiveRecord::Base

  TYPES = ['Vorlesung', 'Übung', 'Seminar', 'Projekt']

  belongs_to :teacher
  belongs_to :course

  validates :dates, :numericality => { :greater_than => 0}
  validates :teacher, :dates,  presence: true
  validates_presence_of :course
    
  validates  :type, inclusion: { in: TYPES }
  validates  :participants,  presence: true

  self.inheritance_column = nil

  delegate :name, :to => :course

  def to_fact
    dl = (double_lecture && "1") || "0"
    "course_component(#{id},#{teacher_id},#{dates},#{participants},#{dl})."
  end

end
