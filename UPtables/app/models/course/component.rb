class Course::Component < ActiveRecord::Base
  
  include GlobalId

  TYPES = [ :Vorlesung, :Übung, :Seminar, :Projekt]

  belongs_to :teacher
  belongs_to :course

  validates :dates,  presence: true, :numericality => { :greater_than => 0}
  validates :dates, :numericality => { :greater_than => 1}, :if => :double_lecture?
  validates :participants,  presence: true, :numericality => { :greater_than => 0}
  validates :teacher,  presence: true
  validates :type, inclusion: { in: TYPES.map(&:to_s) }
  validates_presence_of :course

  has_and_belongs_to_many :required_room_properties, :class_name => 'Room::Property'

  self.inheritance_column = nil

  delegate :name, :to => :course
    
  def lecture?
    type.to_sym == :Vorlesung
  end

  def to_fact
    dl = (double_lecture && "1") || "0"
    facts = ["course_component(#{g_id},#{teacher.g_id},#{dates},#{participants},#{dl})."]
    
    if self.lecture?
      facts << "lecture(#{g_id})."
    end
    
    facts.join("\n")
  end

end
