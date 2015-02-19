class CreateCoursesEctsModulesJoinTable < ActiveRecord::Migration
  def change
    create_table :courses_ects_modules, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :ects_module, index: true
    end
  end
end
