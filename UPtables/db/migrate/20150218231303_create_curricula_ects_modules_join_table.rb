class CreateCurriculaEctsModulesJoinTable < ActiveRecord::Migration
  def change
    create_table :curricula_ects_modules, id: false do |t|
      t.belongs_to :curriculum, index: true
      t.belongs_to :ects_module, index: true
    end
  end
end
