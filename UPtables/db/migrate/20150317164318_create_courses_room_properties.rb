class CreateCoursesRoomProperties < ActiveRecord::Migration
  def change
    create_join_table :course_components, :room_properties
    rename_column :course_components_room_properties, :room_property_id, :property_id
    rename_column :course_components_room_properties, :course_component_id, :component_id
  end
end
