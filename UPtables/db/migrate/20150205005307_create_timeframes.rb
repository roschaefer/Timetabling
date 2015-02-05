class CreateTimeframes < ActiveRecord::Migration
  def change
    create_table :timeframes do |t|
      t.string :interval

      t.timestamps null: false
    end
  end
end
