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
h01 = Room.create(:id => 8, :name => "H01",  :capacity =>100)

#Weekdays have correspondant predicates in encoding with corresponding ids!
monday = Weekday.create(:id => 0, :name => "Montag")
Weekday.create(:id => 1, :name => "Dienstag" )
Weekday.create(:id => 2, :name => "Mittwoch" )
Weekday.create(:id => 3, :name => "Donnerstag" )
Weekday.create(:id => 4, :name => "Freitag" )

#Timeframes have correspondant predicates in encoding with corresponding ids!
eight_o_clock = Timeframe.create(:id => 0, :interval => "08:00 - 10:00 ")
Timeframe.create(:id => 1, :interval => "10:00 - 12:00" )
Timeframe.create(:id => 2, :interval => "12:00 - 14:00" )
Timeframe.create(:id => 3, :interval => "14:00 - 16:00" )
Timeframe.create(:id => 4, :interval => "16:00 - 18:00" )
Timeframe.create(:id => 5, :interval => "18:00 - 20:00" )
Timeframe.create(:id => 6, :interval => "20:00 - 22:00" )

teacher_schaub = Teacher.create(:id => 0, :name => "Torsten", :surname =>"Schaub")
Teacher.create(:id => 1, :name => "Javier",  :surname =>"Romero")
Teacher.create(:id => 2, :name => "Bettina", :surname =>"Schnor")
Teacher.create(:id => 3, :name => "Henning", :surname =>"Bordihn")
Teacher.create(:id => 4, :name => "Tobias", :surname =>"Scheffer")

# Unavailabilities of teaching persons
Teacher::Unavailability.create(:id =>  0, :teacher => teacher_schaub, :weekday_id => 0, :timeframe_id => 0)
Teacher::Unavailability.create(:id =>  1, :teacher => teacher_schaub, :weekday_id => 0, :timeframe_id => 1)
Teacher::Unavailability.create(:id =>  2, :teacher => teacher_schaub, :weekday_id => 0, :timeframe_id => 2)
Teacher::Unavailability.create(:id =>  3, :teacher => teacher_schaub, :weekday_id => 0, :timeframe_id => 3)
Teacher::Unavailability.create(:id =>  4, :teacher => teacher_schaub, :weekday_id => 0, :timeframe_id => 4)
Teacher::Unavailability.create(:id =>  5, :teacher => teacher_schaub, :weekday_id => 0, :timeframe_id => 5)
Teacher::Unavailability.create(:id =>  6, :teacher => teacher_schaub, :weekday_id => 0, :timeframe_id => 6)
Teacher::Unavailability.create(:id =>  7, :teacher => teacher_schaub, :weekday_id => 1, :timeframe_id => 0)
Teacher::Unavailability.create(:id =>  8, :teacher => teacher_schaub, :weekday_id => 1, :timeframe_id => 1)
Teacher::Unavailability.create(:id =>  9, :teacher => teacher_schaub, :weekday_id => 1, :timeframe_id => 2)
Teacher::Unavailability.create(:id => 10, :teacher => teacher_schaub, :weekday_id => 1, :timeframe_id => 3)
Teacher::Unavailability.create(:id => 11, :teacher => teacher_schaub, :weekday_id => 1, :timeframe_id => 4)
Teacher::Unavailability.create(:id => 12, :teacher => teacher_schaub, :weekday_id => 1, :timeframe_id => 5)
Teacher::Unavailability.create(:id => 13, :teacher => teacher_schaub, :weekday_id => 1, :timeframe_id => 6)
Teacher::Unavailability.create(:id => 14, :teacher => teacher_schaub, :weekday_id => 2, :timeframe_id => 0)
Teacher::Unavailability.create(:id => 15, :teacher => teacher_schaub, :weekday_id => 2, :timeframe_id => 1)
Teacher::Unavailability.create(:id => 16, :teacher => teacher_schaub, :weekday_id => 2, :timeframe_id => 2)
Teacher::Unavailability.create(:id => 17, :teacher => teacher_schaub, :weekday_id => 2, :timeframe_id => 3)
Teacher::Unavailability.create(:id => 18, :teacher => teacher_schaub, :weekday_id => 2, :timeframe_id => 4)
Teacher::Unavailability.create(:id => 19, :teacher => teacher_schaub, :weekday_id => 2, :timeframe_id => 5)
Teacher::Unavailability.create(:id => 20, :teacher => teacher_schaub, :weekday_id => 2, :timeframe_id => 6)
Teacher::Unavailability.create(:id => 21, :teacher => teacher_schaub, :weekday_id => 3, :timeframe_id => 0)
Teacher::Unavailability.create(:id => 22, :teacher => teacher_schaub, :weekday_id => 3, :timeframe_id => 1)
Teacher::Unavailability.create(:id => 23, :teacher => teacher_schaub, :weekday_id => 3, :timeframe_id => 2)
Teacher::Unavailability.create(:id => 24, :teacher => teacher_schaub, :weekday_id => 3, :timeframe_id => 3)
Teacher::Unavailability.create(:id => 25, :teacher => teacher_schaub, :weekday_id => 3, :timeframe_id => 4)
Teacher::Unavailability.create(:id => 26, :teacher => teacher_schaub, :weekday_id => 3, :timeframe_id => 5)
Teacher::Unavailability.create(:id => 27, :teacher => teacher_schaub, :weekday_id => 3, :timeframe_id => 6)


Room::Unavailability.create(:room => h01, :weekday => monday, :timeframe => eight_o_clock)
