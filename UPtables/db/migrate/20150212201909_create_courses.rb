class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :teacher_id
      t.integer :dates
      t.integer :minimum_working_days
      t.integer :participants
      t.boolean :double_lecture

      t.timestamps null: false
    end
  end
end
