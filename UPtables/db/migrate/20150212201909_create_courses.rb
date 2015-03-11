class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :teacher_id
      t.integer :participants

      t.timestamps null: false
    end
  end
end
