class Course < ActiveRecord::Base
  validates :dates, :numericality => { :greater_than => 0}
  validate  :check_for_duplicate_recommendations
  belongs_to :teacher
  has_and_belongs_to_many :ects_modules
  has_many :curricula, :through => :ects_modules
  has_many :recommendations
  has_many :recommended_curricula, :through => :recommendations, :source => :curriculum
  accepts_nested_attributes_for :recommendations, :reject_if => :all_blank, :allow_destroy => true

  def self.to_fact
    "courses(#{count})."
  end
  
  def self.all_ordered
     self.order('name asc')
  end

  def to_fact
    dl = (double_lecture && "1") || "0"
    facts = ["course(#{id},#{teacher_id},#{dates},#{minimum_working_days},#{participants},#{dl})."]
    recommendations.each do |r|
      facts << "recommendation(#{id}, #{r.semester}, #{r.curriculum_id})."
    end
    facts.join("\n")
  end

  def check_for_duplicate_recommendations
    if recommendations.map(&:curriculum_id).uniq.size < recommendations.size
      errors.add(:recommendations, "belong to the same curriculum")
    end
  end
end
