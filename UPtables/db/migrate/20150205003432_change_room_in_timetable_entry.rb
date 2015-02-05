class ChangeRoomInTimetableEntry < ActiveRecord::Migration
  def change
    change_column :timetable_entries, :room, :integer
  end
end
