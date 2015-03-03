class RenameCurriculaEctsModulesToCurriculumModuleAssignments < ActiveRecord::Migration
  def change
    rename_table :curricula_ects_modules, :curriculum_module_assignments
  end
end
