class AddCostsToTimetable < ActiveRecord::Migration
  def change
    add_column :timetables, :costs, :integer
  end
end
