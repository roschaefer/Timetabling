class CreateTimetableCommitteeDates < ActiveRecord::Migration
  def change
    create_table :timetable_committee_dates do |t|
      t.belongs_to :weekday, index: true
      t.belongs_to :timeframe, index: true
      t.belongs_to :timetable, index: true

      t.timestamps null: false
    end
    add_foreign_key :timetable_committee_dates, :weekdays
    add_foreign_key :timetable_committee_dates, :timeframes
    add_foreign_key :timetable_committee_dates, :timetables
  end
end
