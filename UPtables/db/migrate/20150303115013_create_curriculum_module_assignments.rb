class CreateCurriculumModuleAssignments < ActiveRecord::Migration
  def change
    create_table :curriculum_module_assignments do |t|
      t.belongs_to :curriculum, index: true
      t.belongs_to :ects_module, index: true
      t.boolean :mandatory, :default => false
      t.timestamps null: false
    end
    add_foreign_key :curriculum_module_assignments, :curricula
    add_foreign_key :curriculum_module_assignments, :ects_modules
  end
end

