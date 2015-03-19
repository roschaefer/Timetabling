class RemoveParticipantsFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :participants, :number
  end
end
