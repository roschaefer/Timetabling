class CreateCourseComponents < ActiveRecord::Migration
  def change
    create_table :course_components do |t|
      t.string :type
      t.integer :dates
      t.boolean :double_lecture
      t.references :teacher, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :course_components, :teachers
    add_foreign_key :course_components, :courses
  end
end
