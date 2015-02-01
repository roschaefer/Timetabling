class AddTimetableIdToTimetableEntry < ActiveRecord::Migration
  def change
    add_column :timetable_entries, :timetable_id, :integer
  end
end
