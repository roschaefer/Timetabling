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

schaub         =  Teacher.create(:id => 0,  :first_name => "Torsten",   :surname =>"Schaub")
romero         =  Teacher.create(:id => 1,  :first_name => "Javier",    :surname =>"Romero")
schnor         =  Teacher.create(:id => 2,  :first_name => "Bettina",   :surname =>"Schnor")
bordihn        =  Teacher.create(:id => 3,  :first_name => "Henning",   :surname =>"Bordihn")
scheffer       =  Teacher.create(:id => 4,  :first_name => "Tobias",    :surname =>"Scheffer")
voigt          =  Teacher.create(:id => 5,  :first_name => "Horst",     :surname =>"Voigt")
lamprecht      =  Teacher.create(:id => 6,  :first_name => "Anna-Lena", :surname =>"Lamprecht")
lucke          =  Teacher.create(:id => 7,  :first_name => "Ulrike",    :surname =>"Lucke")
vogel          =  Teacher.create(:id => 8,  :first_name => "Petra",     :surname =>"Vogel")
schwill        =  Teacher.create(:id => 9,  :first_name => "Andreas",   :surname =>"Schwill")
kiertscher     =  Teacher.create(:id => 10, :first_name => "Simon",     :surname =>"Kiertscher")
reich          =  Teacher.create(:id => 11, :first_name => "Sebastian", :surname =>"Reich")
fiedler        =  Teacher.create(:id => 12, :first_name => "Bernhard",  :surname =>"Fiedler")
kreitz         =  Teacher.create(:id => 13, :first_name => "Christoph", :surname =>"Kreitz")
gordon         =  Teacher.create(:id => 14, :first_name => "Thomas",    :surname =>"Gordon")
kalkbrenner    =  Teacher.create(:id => 15, :first_name => "Gerrit",    :surname =>"Kalkbrenner")
blanchard      =  Teacher.create(:id => 16, :first_name => "Gilles",    :surname =>"Blanchard")
behr           =  Teacher.create(:id => 17, :first_name => "Peter",     :surname =>"Behr")
zinke          =  Teacher.create(:id => 18, :first_name => "Francis",   :surname =>"Zinke")
koehlmann      =  Teacher.create(:id => 19, :first_name => "Wiebke",    :surname =>"Köhlmann")
goessel        =  Teacher.create(:id => 20, :first_name => "Michael",   :surname =>"Gössel")


# Unavailabilities of teaching persons
Weekday.find(0,1,2,3).each do |w|
  Timeframe.all.each do |t|
    Teacher::Unavailability.create(:teacher => schaub, :weekday => w, :timeframe => t)
  end
end


c1  = Course.create(:name => "Informatik für Naturwissenschaftler I Vorlesung"                 , :teacher => voigt      , :dates => 1, :minimum_working_days => 1, :participants => 90 , :double_lecture => false )
c2  = Course.create(:name => "Informatik für Naturwissenschaftler I Übung"                     , :teacher => lamprecht  , :dates => 1, :minimum_working_days => 1, :participants => 30 , :double_lecture => false )
c3  = Course.create(:name => "Grundlagen der Informationsverarbeitung Vorlesung"               , :teacher => lucke      , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c4  = Course.create(:name => "Grundlagen der Informationsverarbeitung Übung"                   , :teacher => vogel      , :dates => 2, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c5  = Course.create(:name => "Grundlagen der Programmierung Vorlesung"                         , :teacher => schwill    , :dates => 2, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c6  = Course.create(:name => "Grundlagen der Programmierung Übung"                             , :teacher => kiertscher , :dates => 6, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c7  = Course.create(:name => "Mathematik für Informatiker I Vorlesung"                         , :teacher => reich      , :dates => 1, :minimum_working_days => 1, :participants => 40 , :double_lecture => false )
c8  = Course.create(:name => "Mathematik für Informatiker I Übung"                             , :teacher => fiedler    , :dates => 2, :minimum_working_days => 1, :participants => 40 , :double_lecture => false )
c9  = Course.create(:name => "Theoretische Informatik I Vorlesung"                             , :teacher => kreitz     , :dates => 1, :minimum_working_days => 1, :participants => 200, :double_lecture => false )
c10 = Course.create(:name => "Theoretische Informatik I Übung"                                 , :teacher => kreitz     , :dates => 4, :minimum_working_days => 1, :participants => 50 , :double_lecture => false )
c11 = Course.create(:name => "Theoretische Informatik I Zusatzübung"                           , :teacher => kreitz     , :dates => 1, :minimum_working_days => 1, :participants => 200, :double_lecture => false )
c12 = Course.create(:name => "Argumentation Systems Engineering Vorlesung/Übung"               , :teacher => gordon     , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c13 = Course.create(:name => "Automotiv, Fahrassistenz und Selbstfahrer Seminar"               , :teacher => kalkbrenner, :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c14 = Course.create(:name => "ClusterComputing Fachseminar"                                    , :teacher => schnor     , :dates => 1, :minimum_working_days => 1, :participants => 12 , :double_lecture => false )
c15 = Course.create(:name => "Face Recognition"                                                , :teacher => scheffer   , :dates => 1, :minimum_working_days => 1, :participants => 5  , :double_lecture => false )
c16 = Course.create(:name => "Grundlagen der Betriebssysteme und Rechnernetze Vorlesung/Übung" , :teacher => schnor     , :dates => 2, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c17 = Course.create(:name => "Grundlagen der Stochastik Vorlesung"                             , :teacher => blanchard  , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c18 = Course.create(:name => "Grundlagen der Stochastik Übung"                                 , :teacher => blanchard  , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c19 = Course.create(:name => "Mikroprozessortechnik Vorlesung"                                 , :teacher => behr       , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c20 = Course.create(:name => "Multimedia-Technologie Vorlesung"                                , :teacher => lucke      , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c21 = Course.create(:name => "Multimedia-Technologie Übung"                                    , :teacher => zinke      , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c22 = Course.create(:name => "Pimp your video conference! Projekt"                             , :teacher => koehlmann  , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c23 = Course.create(:name => "Software Engineering I Vorlesung"                                , :teacher => bordihn    , :dates => 1, :minimum_working_days => 1, :participants => 75 , :double_lecture => false )
c24 = Course.create(:name => "Software Engineering I Übung"                                    , :teacher => bordihn    , :dates => 3, :minimum_working_days => 1, :participants => 25 , :double_lecture => false )
c25 = Course.create(:name => "Software Engineering I Projekt"                                  , :teacher => voigt      , :dates => 1, :minimum_working_days => 1, :participants => 75 , :double_lecture => false )
c26 = Course.create(:name => "Wissenschaftliche Workflows Proseminar"                          , :teacher => lamprecht  , :dates => 1, :minimum_working_days => 1, :participants => 12 , :double_lecture => false )
c27 = Course.create(:name => "Absicherung von IPv6-Netzen Fachseminar"                         , :teacher => schnor     , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c28 = Course.create(:name => "Agententechnologie/Agent-technology Seminar"                     , :teacher => schaub     , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c29 = Course.create(:name => "Cartesisches Seminar Oberseminar"                                , :teacher => kreitz     , :dates => 1, :minimum_working_days => 1, :participants => 12 , :double_lecture => false )
c30 = Course.create(:name => "Codierungstheorie 2 Seminar"                                     , :teacher => goessel    , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c31 = Course.create(:name => "Deklarative Problemlösung und Optimierung Vorlesung"             , :teacher => schaub     , :dates => 2, :minimum_working_days => 1, :participants => 10 , :double_lecture => true  )
c32 = Course.create(:name => "Deklarative Problemlösung und Optimierung Übung"                 , :teacher => romero     , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )
c33 = Course.create(:name => "Current Topics in Computational Intelligence Seminar"            , :teacher => schaub     , :dates => 1, :minimum_working_days => 1, :participants => 10 , :double_lecture => false )

Room::Unavailability.create(:room => h01, :weekday => monday, :timeframe => eight_o_clock)



bC = Curriculum.create(:name => "B.Sc. Computational Science")
bW = Curriculum.create(:name => "B. Wirtschaftsinformatik")
bL = Curriculum.create(:name => "B. Lehramt")
bI = Curriculum.create(:name => "B.Sc. Informatik")


mathe              = EctsModule.create(:name => "Mathematik")
paeda              = EctsModule.create(:name => "Pädagogik")
programming        = EctsModule.create(:name => "Programmierung")
management         = EctsModule.create(:name => "Management")
scientific_writing = EctsModule.create(:name => "Wissenschaftliches Schreiben")


bC.ects_modules.push( mathe, programming, scientific_writing )
bW.ects_modules.push( mathe, programming, management         )
bL.ects_modules.push( mathe, paeda, programming              )
bI.ects_modules.push( mathe, programming                     )


c1.ects_modules.push(  scientific_writing, programming )
c2.ects_modules.push(  scientific_writing, programming )
c3.ects_modules.push(  programming, mathe              )
c4.ects_modules.push(  programming, mathe              )
c5.ects_modules.push(  programming, management         )
c6.ects_modules.push(  programming, management         )
c7.ects_modules.push(  mathe                           )
c8.ects_modules.push(  mathe                           )
c9.ects_modules.push(  mathe, programming              )
c10.ects_modules.push( mathe, programming              )
c11.ects_modules.push( mathe, programming              )
c12.ects_modules.push( programming                     )
c13.ects_modules.push( programming                     )
c14.ects_modules.push( programming                     )
c15.ects_modules.push( programming                     )
c16.ects_modules.push( programming                     )
c17.ects_modules.push( scientific_writing              )
c18.ects_modules.push( scientific_writing              )
c19.ects_modules.push( programming                     )
c20.ects_modules.push( programming                     )
c21.ects_modules.push( programming                     )
c22.ects_modules.push( programming                     )
c23.ects_modules.push( programming                     )
c24.ects_modules.push( programming                     )
c25.ects_modules.push( programming                     )
c26.ects_modules.push( scientific_writing              )
c27.ects_modules.push( programming                     )
c28.ects_modules.push( programming                     )
c29.ects_modules.push( paeda                           )
c30.ects_modules.push( programming                     )
c31.ects_modules.push( programming                     )
c32.ects_modules.push( programming                     )
c33.ects_modules.push( programming                     )
