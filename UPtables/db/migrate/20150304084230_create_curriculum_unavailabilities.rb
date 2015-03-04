class CreateCurriculumUnavailabilities < ActiveRecord::Migration
  def change
    create_table :curriculum_unavailabilities do |t|
      t.belongs_to :weekday, index: true
      t.belongs_to :timeframe, index: true
      t.belongs_to :curriculum, index: true

      t.timestamps null: false
    end
    add_foreign_key :curriculum_unavailabilities, :weekdays
    add_foreign_key :curriculum_unavailabilities, :timeframes
    add_foreign_key :curriculum_unavailabilities, :curricula
  end
end
