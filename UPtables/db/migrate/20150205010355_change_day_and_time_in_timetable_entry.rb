class ChangeDayAndTimeInTimetableEntry < ActiveRecord::Migration
  def change
    rename_column :timetable_entries, :day, :weekday_id
    rename_column :timetable_entries, :time, :timeframe_id
  end
end
