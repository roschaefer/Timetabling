class CreateRoomPropertiesRooms < ActiveRecord::Migration
  def change
    create_join_table :room_properties, :rooms
    rename_column :room_properties_rooms, :room_property_id, :property_id
  end
end
