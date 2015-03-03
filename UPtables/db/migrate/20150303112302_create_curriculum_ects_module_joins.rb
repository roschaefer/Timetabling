class CreateCurriculumEctsModuleJoins < ActiveRecord::Migration
  def change
    create_table :curriculum_ects_module_joins do |t|
      t.belongs_to :curriculum, index: true
      t.belongs_to :ects_module, index: true
      t.boolean :mandatory, :default => true

      t.timestamps null: false
    end
    add_foreign_key :curriculum_ects_module_joins, :curricula
    add_foreign_key :curriculum_ects_module_joins, :ects_modules
  end
end
