class CreateUnavailabilities < ActiveRecord::Migration
  def change
    create_table :unavailabilities do |t|
      t.references :teacher, index: true
      t.references :weekday, index: true
      t.references :timeframe, index: true

      t.timestamps null: false
    end
    add_foreign_key :unavailabilities, :teachers
    add_foreign_key :unavailabilities, :weekdays
    add_foreign_key :unavailabilities, :timeframes
  end
end
