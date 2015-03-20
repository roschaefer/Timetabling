class Course < ActiveRecord::Base
  validate  :check_for_duplicate_recommendations
  validates  :name,  presence: true
    
  belongs_to :teacher
  has_and_belongs_to_many :ects_modules
  has_many :curricula, :through => :ects_modules
  has_many :recommendations
  has_many :recommended_curricula, :through => :recommendations, :source => :curriculum
  has_many :components, dependent: :destroy
  accepts_nested_attributes_for :components, :reject_if => proc {|a| a['type'].blank? and a['teacher_id'].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :recommendations, :reject_if => :all_blank, :allow_destroy => true

  def self.to_fact
    "courses(#{count})."
  end
  
  def self.all_ordered
     self.order('name asc')
  end

  def to_fact
    facts = ["course(#{id},#{teacher_id},#{participants})."]
    recommendations.each do |r|
      components.each do |cc|  
        facts << "recommendation(#{cc.id}, #{r.semester}, #{r.curriculum_id})."
      end
    end
    facts.join("\n")
  end

  def check_for_duplicate_recommendations
    if recommendations.map(&:curriculum_id).uniq.size < recommendations.size
      errors.add(:recommendations, "belong to the same curriculum")
    end
  end
end
