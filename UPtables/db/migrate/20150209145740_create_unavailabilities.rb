class CreateUnavailabilities < ActiveRecord::Migration
  def change
    create_table :unavailabilities do |t|
      t.integer :teacher_id
      t.integer :weekday_id
      t.integer :timeframe_id

      t.timestamps null: false
    end
  end
end
