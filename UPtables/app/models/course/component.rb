class Course::Component < ActiveRecord::Base
  include Asp::Element
  include GlobalId

  TYPES = [:lecture, :tutorial, :seminar, :project]

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

  def asp_representation
    dl = (double_lecture && "1") || "0"
    "course_component(#{g_id},#{teacher.g_id},#{dates},#{participants},#{dl},#{type})."
  end

end
