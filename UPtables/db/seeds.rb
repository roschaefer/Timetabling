# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Rooms have correspondant id in facts.lp !!
Room.create(:id => 1, :name => "0.02", :capacity => 32)
Room.create(:id => 2, :name => "0.03", :capacity => 32)
Room.create(:id => 3, :name => "0.04", :capacity => 32)
Room.create(:id => 4, :name => "1.02", :capacity => 32)
Room.create(:id => 5, :name => "1.03", :capacity => 32)
Room.create(:id => 6, :name => "2.01", :capacity => 16)
Room.create(:id => 7, :name => "2.14", :capacity => 12)
Room.create(:id => 8, :name => "H01",  :capacity =>100)
