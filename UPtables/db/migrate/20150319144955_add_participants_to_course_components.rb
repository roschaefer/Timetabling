class AddParticipantsToCourseComponents < ActiveRecord::Migration
  def change
    add_column :course_components, :participants, :integer
  end
end
