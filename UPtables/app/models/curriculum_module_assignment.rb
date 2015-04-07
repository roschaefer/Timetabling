class CurriculumModuleAssignment < ActiveRecord::Base
  belongs_to :ects_module
  belongs_to :curriculum

  validates :ects_module, :curriculum, :presence => true

  def to_fact
    if mandatory
      facts = []
      ects_module.courses.each do |course|
        course.components. each do |cc|
          facts << "mandatory(#{cc.g_id},#{curriculum.g_id})."
        end
      end
      facts.join("\n")
    else
      ""
    end
  end
end
