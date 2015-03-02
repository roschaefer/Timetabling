class Recommendation < ActiveRecord::Base
  belongs_to :course
  belongs_to :curriculum
  validates :semester, :course_id, :curriculum_id, presence: true
  validates :curriculum_id, :uniqueness => { :scope => :course_id }
  validate :course_belongs_to_curriculum


  def course_belongs_to_curriculum
    unless course.curricula.include?(self.curriculum)
      errors.add(:course, "doesn't belong to the given curriculum")
    end
  end
end
