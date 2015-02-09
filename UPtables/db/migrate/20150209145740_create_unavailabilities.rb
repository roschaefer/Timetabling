class CreateUnavailabilities < ActiveRecord::Migration
  def change
    create_table :unavailabilities do |t|
      t.integer :teacher
      t.integer :weekday
      t.integer :timeframe

      t.timestamps null: false
    end
  end
end
