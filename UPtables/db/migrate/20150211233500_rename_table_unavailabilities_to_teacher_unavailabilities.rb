class RenameTableUnavailabilitiesToTeacherUnavailabilities < ActiveRecord::Migration
  def change
    rename_table :unavailabilities, :teacher_unavailabilities
  end
end
