class RenameRoomToRoomIdInTimetableEntries < ActiveRecord::Migration
  def change
    rename_column :timetable_entries, :room, :room_id
  end
end
