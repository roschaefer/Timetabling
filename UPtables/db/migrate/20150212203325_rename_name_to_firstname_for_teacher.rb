class RenameNameToFirstnameForTeacher < ActiveRecord::Migration
  def change
    rename_column :teachers,:name, :first_name
  end
end
