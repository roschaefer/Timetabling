# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

# Rooms have correspondant id in facts.lp !!
Room.create!(:id => 1, :name => "0.02", :capacity => 32)
Room.create!(:id => 2, :name => "0.03", :capacity => 32)
Room.create!(:id => 3, :name => "0.04", :capacity => 32)
Room.create!(:id => 4, :name => "1.02", :capacity => 32)
Room.create!(:id => 5, :name => "1.03", :capacity => 32)
Room.create!(:id => 6, :name => "2.01", :capacity => 16)
Room.create!(:id => 7, :name => "2.14", :capacity => 12)
h01 = Room.create!(:id => 8, :name => "H01",  :capacity =>100)

#Weekdays have correspondant predicates in encoding with corresponding ids!
monday = Weekday.create!(:id => 0, :name => "Montag")
Weekday.create!(:id => 1, :name => "Dienstag" )
Weekday.create!(:id => 2, :name => "Mittwoch" )
Weekday.create!(:id => 3, :name => "Donnerstag" )
Weekday.create!(:id => 4, :name => "Freitag" )

#Timeframes have correspondant predicates in encoding with corresponding ids!
eight_o_clock = Timeframe.create!(:id => 0, :interval => "08:00 - 10:00 ")
Timeframe.create!(:id => 1, :interval => "10:00 - 12:00" )
Timeframe.create!(:id => 2, :interval => "12:00 - 14:00" )
Timeframe.create!(:id => 3, :interval => "14:00 - 16:00" )
Timeframe.create!(:id => 4, :interval => "16:00 - 18:00" )
Timeframe.create!(:id => 5, :interval => "18:00 - 20:00" )

schaub         =  Teacher.create!(:id => 0,  :first_name => "Torsten",   :surname =>"Schaub")
romero         =  Teacher.create!(:id => 1,  :first_name => "Javier",    :surname =>"Romero")
schnor         =  Teacher.create!(:id => 2,  :first_name => "Bettina",   :surname =>"Schnor")
bordihn        =  Teacher.create!(:id => 3,  :first_name => "Henning",   :surname =>"Bordihn")
scheffer       =  Teacher.create!(:id => 4,  :first_name => "Tobias",    :surname =>"Scheffer")
voigt          =  Teacher.create!(:id => 5,  :first_name => "Horst",     :surname =>"Voigt")
lamprecht      =  Teacher.create!(:id => 6,  :first_name => "Anna-Lena", :surname =>"Lamprecht")
lucke          =  Teacher.create!(:id => 7,  :first_name => "Ulrike",    :surname =>"Lucke")
vogel          =  Teacher.create!(:id => 8,  :first_name => "Petra",     :surname =>"Vogel")
schwill        =  Teacher.create!(:id => 9,  :first_name => "Andreas",   :surname =>"Schwill")
kiertscher     =  Teacher.create!(:id => 10, :first_name => "Simon",     :surname =>"Kiertscher")
reich          =  Teacher.create!(:id => 11, :first_name => "Sebastian", :surname =>"Reich")
fiedler        =  Teacher.create!(:id => 12, :first_name => "Bernhard",  :surname =>"Fiedler")
kreitz         =  Teacher.create!(:id => 13, :first_name => "Christoph", :surname =>"Kreitz")
gordon         =  Teacher.create!(:id => 14, :first_name => "Thomas",    :surname =>"Gordon")
kalkbrenner    =  Teacher.create!(:id => 15, :first_name => "Gerrit",    :surname =>"Kalkbrenner")
blanchard      =  Teacher.create!(:id => 16, :first_name => "Gilles",    :surname =>"Blanchard")
behr           =  Teacher.create!(:id => 17, :first_name => "Peter",     :surname =>"Behr")
zinke          =  Teacher.create!(:id => 18, :first_name => "Francis",   :surname =>"Zinke")
koehlmann      =  Teacher.create!(:id => 19, :first_name => "Wiebke",    :surname =>"Köhlmann")
goessel        =  Teacher.create!(:id => 20, :first_name => "Michael",   :surname =>"Gössel")


# Unavailabilities of teaching persons
Weekday.find(0,1,2,3).each do |w|
  Timeframe.all.each do |t|
    Teacher::Unavailability.create!(:teacher => schaub, :weekday => w, :timeframe => t)
  end
end

courses = []
courses[0]  = Course.create!(:name => "Informatik für Naturwissenschaftler I"                           , :teacher => voigt      )
courses[1]  = Course.create!(:name => "Grundlagen der Informationsverarbeitung"                         , :teacher => lucke      )
courses[2]  = Course.create!(:name => "Grundlagen der Programmierung"                                   , :teacher => schwill    )
courses[3]  = Course.create!(:name => "Mathematik für Informatiker I"                                   , :teacher => reich      )
courses[4]  = Course.create!(:name => "Theoretische Informatik I"                                       , :teacher => kreitz     )
courses[5]  = Course.create!(:name => "Argumentation Systems Engineering"                               , :teacher => gordon     )
courses[6]  = Course.create!(:name => "Automotiv, Fahrassistenz und Selbstfahrer"                       , :teacher => kalkbrenner)
courses[7]  = Course.create!(:name => "ClusterComputing Fachseminar"                                    , :teacher => schnor     )
courses[8]  = Course.create!(:name => "Face Recognition"                                                , :teacher => scheffer   )
courses[9]  = Course.create!(:name => "Grundlagen der Betriebssysteme und Rechnernetze"                 , :teacher => schnor     )
courses[10] = Course.create!(:name => "Grundlagen der Stochastik"                                       , :teacher => blanchard  )
courses[11] = Course.create!(:name => "Mikroprozessortechnik"                                           , :teacher => behr       )
courses[12] = Course.create!(:name => "Multimedia-Technologie"                                          , :teacher => lucke      )
courses[13] =  Course.create!(:name => "Pimp your video conference!"                                    , :teacher => koehlmann  )

#courses << Course.create!(:name => "Software Engineering I Vorlesung"                                , :teacher => bordihn    , :dates => 1, :participants => 75 )
#courses << Course.create!(:name => "Software Engineering I Übung"                                    , :teacher => bordihn    , :dates => 3, :participants => 25 )
#courses << Course.create!(:name => "Software Engineering I Projekt"                                  , :teacher => voigt      , :dates => 1, :participants => 75 )
#courses << Course.create!(:name => "Wissenschaftliche Workflows Proseminar"                          , :teacher => lamprecht  , :dates => 1, :participants => 12 )
#courses << Course.create!(:name => "Absicherung von IPv6-Netzen Fachseminar"                         , :teacher => schnor     , :dates => 1, :participants => 10 )
#courses << Course.create!(:name => "Agententechnologie/Agent-technology Seminar"                     , :teacher => schaub     , :dates => 1, :participants => 10 )
#courses << Course.create!(:name => "Cartesisches Seminar Oberseminar"                                , :teacher => kreitz     , :dates => 1, :participants => 12 )
#courses << Course.create!(:name => "Codierungstheorie 2 Seminar"                                     , :teacher => goessel    , :dates => 1, :participants => 10 )
#courses << Course.create!(:name => "Deklarative Problemlösung und Optimierung Vorlesung"             , :teacher => schaub     , :dates => 2, :participants => 10 )
#courses << Course.create!(:name => "Deklarative Problemlösung und Optimierung Übung"                 , :teacher => romero     , :dates => 1, :participants => 10 )
#courses << Course.create!(:name => "Current Topics in Computational Intelligence Seminar"            , :teacher => schaub     , :dates => 1, :participants => 10 )


Course::Component.create!(:course => courses[0] , :type => :lecture      , :teacher => voigt       , :dates => 1, :double_lecture => false, :participants => 100)
Course::Component.create!(:course => courses[0] , :type => :tutorial     , :teacher => lamprecht   , :dates => 1, :double_lecture => false, :participants => 25)
Course::Component.create!(:course => courses[1] , :type => :lecture      , :teacher => lucke       , :dates => 1, :double_lecture => false, :participants => 100)
Course::Component.create!(:course => courses[1] , :type => :tutorial     , :teacher => vogel       , :dates => 2, :double_lecture => false, :participants => 12)
Course::Component.create!(:course => courses[2] , :type => :lecture      , :teacher => schwill     , :dates => 2, :double_lecture => false, :participants => 100)
Course::Component.create!(:course => courses[2] , :type => :tutorial     , :teacher => kiertscher  , :dates => 6, :double_lecture => false, :participants => 10)
Course::Component.create!(:course => courses[3] , :type => :lecture      , :teacher => reich       , :dates => 1, :double_lecture => false, :participants => 200)
Course::Component.create!(:course => courses[3] , :type => :tutorial     , :teacher => fiedler     , :dates => 2, :double_lecture => false, :participants => 10)
Course::Component.create!(:course => courses[4] , :type => :lecture      , :teacher => kreitz      , :dates => 1, :double_lecture => false, :participants => 200)
Course::Component.create!(:course => courses[4] , :type => :tutorial     , :teacher => kreitz      , :dates => 4, :double_lecture => false, :participants => 10)
Course::Component.create!(:course => courses[5] , :type => :lecture      , :teacher => gordon      , :dates => 1, :double_lecture => false, :participants => 40)
Course::Component.create!(:course => courses[6] , :type => :seminar      , :teacher => kalkbrenner , :dates => 1, :double_lecture => false, :participants => 20)
Course::Component.create!(:course => courses[7] , :type => :seminar      , :teacher => schnor      , :dates => 1, :double_lecture => false, :participants => 20)
Course::Component.create!(:course => courses[8] , :type => :seminar      , :teacher => scheffer    , :dates => 1, :double_lecture => false, :participants => 10)
Course::Component.create!(:course => courses[9] , :type => :lecture      , :teacher => schnor      , :dates => 1, :double_lecture => false, :participants => 30)
Course::Component.create!(:course => courses[9] , :type => :tutorial     , :teacher => schnor      , :dates => 1, :double_lecture => false, :participants => 30)
Course::Component.create!(:course => courses[10], :type => :lecture      , :teacher => blanchard   , :dates => 1, :double_lecture => false, :participants => 30)
Course::Component.create!(:course => courses[10], :type => :tutorial     , :teacher => blanchard   , :dates => 1, :double_lecture => false, :participants => 30)
Course::Component.create!(:course => courses[11], :type => :lecture      , :teacher => behr        , :dates => 1, :double_lecture => false, :participants => 20)
Course::Component.create!(:course => courses[12], :type => :lecture      , :teacher => lucke       , :dates => 1, :double_lecture => false, :participants => 20)
Course::Component.create!(:course => courses[12], :type => :tutorial     , :teacher => zinke       , :dates => 1, :double_lecture => false, :participants => 10)
Course::Component.create!(:course => courses[13], :type => :project      , :teacher => koehlmann   , :dates => 1, :double_lecture => false, :participants => 10)


Room::Unavailability.create!(:room => h01, :weekday => monday, :timeframe => eight_o_clock)

ects_modules = []
ects_modules << EctsModule.create!(:name => "Grundlagen der Programmierung")
ects_modules << EctsModule.create!(:name => "Algorithmen und Datenstrukturen")
ects_modules << EctsModule.create!(:name => "Theoretische Grundlagen: Effiziente Algorithmen")
ects_modules << EctsModule.create!(:name => "Konzepte paralleler Programmierung")

curricula = []
curricula << Curriculum.create!(:name => "Informatik Bachelor")
curricula << Curriculum.create!(:name => "Informatik Master")
curricula << Curriculum.create!(:name => "CS Bachelor")
curricula << Curriculum.create!(:name => "CS Master")

curricula.each do |c|
  c.ects_modules << ects_modules.sample(Random.rand(ects_modules.size))
end

courses.each do |course|
  course.ects_modules << ects_modules.sample(Random.rand(ects_modules.size))
end

Room::Property.create(:name => "Beamer")
Room::Property.create(:name => "Computer pool")
