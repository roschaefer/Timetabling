class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :course, index: true
      t.references :curriculum, index: true
      t.integer :semester

      t.timestamps null: false
    end
    add_foreign_key :recommendations, :courses
    add_foreign_key :recommendations, :curricula
  end
end
