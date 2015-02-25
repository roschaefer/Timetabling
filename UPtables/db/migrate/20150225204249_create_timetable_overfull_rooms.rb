class CreateTimetableOverfullRooms < ActiveRecord::Migration
  def change
    create_table :timetable_overfull_rooms do |t|
      t.references :entry, index: true
      t.integer :severity

      t.timestamps null: false
    end
    add_foreign_key :timetable_overfull_rooms, :timetable_entries
  end
end
