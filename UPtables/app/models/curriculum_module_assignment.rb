class CurriculumModuleAssignment < ActiveRecord::Base
  belongs_to :ects_module
  belongs_to :curriculum
  
  validates :ects_module, :curriculum, :presence => true
    
  def to_fact
    if mandatory
      facts = []
      ects_module.courses.each do |course|
        facts << "mandatory(#{curriculum_id},#{course.id})."
      end
      facts.join("\n")
    else
      ""
    end
  end
end
