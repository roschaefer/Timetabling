class Schema < ActiveRecord::Migration
  def change
    create_table :assigneds, force: true do |t|
      t.string  :course
      t.string  :room
      t.string  :day
      t.string  :time
      t.integer :cost
      t.integer :solution
    end
  end
end
