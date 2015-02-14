class RenameCourseToCourseIdInTimetableEntry < ActiveRecord::Migration
  def change
    change_column :timetable_entries, :course, :integer
    rename_column :timetable_entries, :course, :course_id
  end
end
