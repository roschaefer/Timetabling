class ChangeForeignKeyOfTimetableEntryToCourseComponent < ActiveRecord::Migration
  def change
    rename_column :timetable_entries, :course_id, :course_component_id
  end
end
