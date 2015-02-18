class CreateEctsModules < ActiveRecord::Migration
  def change
    create_table :ects_modules do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
