class CreateTimetableOverfullRooms < ActiveRecord::Migration
  def change
    create_table :timetable_overfull_rooms do |t|
      t.references :timetable, index: true
      t.references :timetable_entry, index: true
      t.integer :severity

      t.timestamps null: false
    end
    add_foreign_key :timetable_overfull_rooms, :timetables
    add_foreign_key :timetable_overfull_rooms, :timetable_entries
  end
end
