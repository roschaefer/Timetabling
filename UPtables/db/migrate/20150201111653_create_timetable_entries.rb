class CreateTimetableEntries < ActiveRecord::Migration
  def change
    create_table :timetable_entries do |t|
      t.string :course
      t.string :room
      t.integer :day
      t.integer :time

      t.timestamps null: false
    end
  end
end
