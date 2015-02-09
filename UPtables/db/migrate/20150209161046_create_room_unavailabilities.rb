class CreateRoomUnavailabilities < ActiveRecord::Migration
  def change
    create_table :room_unavailabilities do |t|
      t.integer :room_id
      t.integer :weekday_id
      t.integer :timeframe_id

      t.timestamps null: false
    end
  end
end
