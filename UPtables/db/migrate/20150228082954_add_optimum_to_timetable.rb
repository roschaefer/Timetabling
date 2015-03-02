class AddOptimumToTimetable < ActiveRecord::Migration
  def change
    add_column :timetables, :optimum, :boolean
  end
end
