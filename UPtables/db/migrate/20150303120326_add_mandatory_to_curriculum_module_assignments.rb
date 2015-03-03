class AddMandatoryToCurriculumModuleAssignments < ActiveRecord::Migration
  def change
    add_column :curriculum_module_assignments, :mandatory, :boolean
  end
end
