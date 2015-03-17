class CreateCoursesRoomProperties < ActiveRecord::Migration
  def change
    create_join_table :courses, :room_properties
    rename_column :courses_room_properties, :room_property_id, :property_id
  end
end
