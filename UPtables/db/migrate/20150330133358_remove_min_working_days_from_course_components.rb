class RemoveMinWorkingDaysFromCourseComponents < ActiveRecord::Migration
  def change
    remove_column :course_components, :minimum_working_days, :integer
  end
end
