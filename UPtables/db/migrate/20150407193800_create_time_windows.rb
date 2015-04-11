class CreateTimeWindows < ActiveRecord::Migration
  def change
    create_table :time_windows do |t|
      t.references :timeframe, index: true
      t.references :weekday, index: true
      t.references :curriculum, index: true
      t.integer :semester

      t.timestamps null: false
    end
    add_foreign_key :time_windows, :timeframes
    add_foreign_key :time_windows, :weekdays
    add_foreign_key :time_windows, :curricula
  end
end
