# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

# Rooms have correspondant id in facts.lp !!
room_1 = Room.create!(:id => 1, :name => "Room 1", :capacity => 32)
room_2 = Room.create!(:id => 2, :name => "Room 2", :capacity => 32)
room_3 = Room.create!(:id => 3, :name => "Room 3", :capacity => 16)
room_4 = Room.create!(:id => 4, :name => "Room 4", :capacity => 12)
h01 = Room.create!(:id => 5, :name => "H01",  :capacity => 50)

#Weekdays have correspondant predicates in encoding with corresponding ids!
monday = Weekday.create!(:id => 0, :name => "Montag")
tuesday = Weekday.create!(:id => 1, :name => "Dienstag" )
wednesday = Weekday.create!(:id => 2, :name => "Mittwoch" )

#Timeframes have correspondant predicates in encoding with corresponding ids!
eight_o_clock = Timeframe.create!(:id => 0, :interval => "08:00 - 10:00 ")
Timeframe.create!(:id => 1, :interval => "10:00 - 12:00" )
Timeframe.create!(:id => 2, :interval => "12:00 - 14:00" )

math_prof         = Teacher.create!(:id => 1,  :first_name => "Math",   :surname         =>"Prof")
stochastic_prof   = Teacher.create!(:id => 2,  :first_name => "Stochastic",   :surname   =>"Prof")
programming_prof  = Teacher.create!(:id => 3,  :first_name => "Programming",   :surname  =>"Prof")
programming_tutor = Teacher.create!(:id => 4,  :first_name => "Programming",    :surname =>"Tutor")
programming_tutor2= Teacher.create!(:id => 5,  :first_name => "Programming",    :surname =>"Tutor")
education_prof    = Teacher.create!(:id => 6,  :first_name => "Programming",    :surname =>"Second Tutor")
robotics_prof     = Teacher.create!(:id => 7,  :first_name => "Robotics",    :surname =>"Prof")
computer_vision_prof     = Teacher.create!(:id => 8,  :first_name => "Computer Vision",    :surname =>"Prof")



# MATH CURRICULUM
math_curriculum =  Curriculum.create!(:name => "Mathematics Bachelor")
math_basics =  EctsModule.create!(:name => "Basics of Mathematics")
CurriculumModuleAssignment.create!(:ects_module => math_basics, :curriculum => math_curriculum, :mandatory => true)
stochastic_basics =  EctsModule.create!(:name => "Basics of Stochastic")
CurriculumModuleAssignment.create!(:ects_module => stochastic_basics, :curriculum => math_curriculum, :mandatory => true)

mathematik1  = Course.create!(:name => "Mathematics I", :teacher => math_prof)
mathematik2  = Course.create!(:name => "Mathematics II", :teacher => math_prof)
mathematik3  = Course.create!(:name => "Mathematics III", :teacher => math_prof)
Course::Component.create!(:course => mathematik1 , :type => :lecture      , :teacher => math_prof      , :dates => 1, :double_lecture => false, :participants => 60)
Course::Component.create!(:course => mathematik2 , :type => :lecture      , :teacher => math_prof      , :dates => 1, :double_lecture => false, :participants => 50)
Course::Component.create!(:course => mathematik3 , :type => :lecture      , :teacher => math_prof      , :dates => 1, :double_lecture => false, :participants => 30)

mathematik1.ects_modules << math_basics
mathematik2.ects_modules << math_basics
mathematik3.ects_modules << math_basics

stochastic1  = Course.create!(:name => "Stochastic I", :teacher => stochastic_prof)
stochastic2  = Course.create!(:name => "Stochastic II", :teacher => stochastic_prof)
stochastic3  = Course.create!(:name => "Stochastic III", :teacher => stochastic_prof)
Course::Component.create!(:course => stochastic1 , :type => :lecture      , :teacher => stochastic_prof      , :dates => 1, :double_lecture => false, :participants => 50)
Course::Component.create!(:course => stochastic2 , :type => :lecture      , :teacher => stochastic_prof      , :dates => 1, :double_lecture => false, :participants => 20)
Course::Component.create!(:course => stochastic3 , :type => :lecture      , :teacher => stochastic_prof      , :dates => 1, :double_lecture => false, :participants => 10)

stochastic1.ects_modules << stochastic_basics
stochastic2.ects_modules << stochastic_basics
stochastic3.ects_modules << stochastic_basics


# COMPUTER DCIENCE CURRICULUM
computer_science_curriculum  =  Curriculum.create!(:name => "Computer Science Bachelor")
programming_basics = EctsModule.create!(:name => "Basics of Programming")
CurriculumModuleAssignment.create!(:ects_module => programming_basics, :curriculum => computer_science_curriculum, :mandatory => true)
advanced_programming = EctsModule.create!(:name => "Advanced Programming")
CurriculumModuleAssignment.create!(:ects_module => advanced_programming, :curriculum => computer_science_curriculum, :mandatory => false)
robotics = EctsModule.create!(:name => "Robotics")
CurriculumModuleAssignment.create!(:ects_module => robotics, :curriculum => computer_science_curriculum, :mandatory => true)
computer_vision = EctsModule.create!(:name => "Computer Vision")
CurriculumModuleAssignment.create!(:ects_module => computer_vision, :curriculum => computer_science_curriculum, :mandatory => true)
# take care, this actually belongs to section match curriculum
CurriculumModuleAssignment.create!(:ects_module => math_basics, :curriculum => computer_science_curriculum, :mandatory => true)

programming1  = Course.create!(:name => "Programming I", :teacher => programming_prof)
programming2  = Course.create!(:name => "Programming II", :teacher => programming_prof)
programming1.ects_modules << programming_basics
programming2.ects_modules << programming_basics
Course::Component.create!(:course => programming1 , :type => :lecture      , :teacher =>  programming_prof, :dates => 1, :double_lecture => false, :participants => 50)
Course::Component.create!(:course => programming2 , :type => :lecture      , :teacher =>  programming_prof, :dates => 1, :double_lecture => false, :participants => 30)
Course::Component.create!(:course => programming1 , :type => :tutorial      , :teacher =>  programming_tutor, :dates => 2, :double_lecture => false, :participants => 25)
Course::Component.create!(:course => programming2 , :type => :tutorial      , :teacher =>  programming_tutor, :dates => 2, :double_lecture => false, :participants => 15)
Course::Component.create!(:course => programming1 , :type => :tutorial      , :teacher =>  programming_tutor2, :dates => 2, :double_lecture => false, :participants => 25)
Course::Component.create!(:course => programming2 , :type => :tutorial      , :teacher =>  programming_tutor2, :dates => 2, :double_lecture => false, :participants => 15)

robotics1 = Course.create!(:name => "Robotics I", :teacher => robotics_prof)
robotics2 = Course.create!(:name => "Robotics II", :teacher => robotics_prof)
robotics1.ects_modules << robotics
robotics2.ects_modules << robotics
Course::Component.create!(:course =>  robotics1, :type => :lecture, :teacher =>  robotics_prof, :dates => 2, :double_lecture => false, :participants => 40)
Course::Component.create!(:course =>  robotics2, :type => :lecture, :teacher =>  robotics_prof, :dates => 2, :double_lecture => false, :participants => 30)
Recommendation.create!(:course => robotics1, :curriculum => computer_science_curriculum, :semester => 3)
Recommendation.create!(:course => robotics2, :curriculum => computer_science_curriculum, :semester => 5)

computer_vision1 = Course.create!(:name => "Computer Vision I", :teacher => computer_vision_prof)
computer_vision1.ects_modules << computer_vision
Course::Component.create!(:course => computer_vision1, :type => :lecture, :teacher => computer_vision_prof, :dates => 2, :double_lecture => false, :participants => 30)
Recommendation.create!(:course => computer_vision1, :curriculum => computer_science_curriculum, :semester => 3)

java_programming = Course.create!(:name => "Java Programming", :teacher => programming_prof)
ruby_programming = Course.create!(:name => "Ruby Programming", :teacher => programming_prof)
python_programming = Course.create!(:name => "Python Programming", :teacher => programming_prof)
java_programming.ects_modules << advanced_programming
ruby_programming.ects_modules << advanced_programming
python_programming.ects_modules << advanced_programming
Course::Component.create!(:course => java_programming , :type => :tutorial, :teacher =>  programming_tutor, :dates => 1, :double_lecture => false, :participants => 15)
Course::Component.create!(:course => ruby_programming , :type => :tutorial, :teacher =>  programming_tutor, :dates => 1, :double_lecture => false, :participants => 15)
Course::Component.create!(:course => python_programming , :type => :tutorial, :teacher =>  programming_tutor, :dates => 1, :double_lecture => false, :participants => 15)

# CURRICLUM OF TEACHER TAINING
teacher_training_curriculum  =  Curriculum.create!(:name => "Teacher Training")
# take care, this actually belongs to section computer science curriculum
CurriculumModuleAssignment.create!(:ects_module => programming_basics, :curriculum => teacher_training_curriculum, :mandatory => true)
education = EctsModule.create!(:name => "Education")
CurriculumModuleAssignment.create!(:ects_module => education, :curriculum => teacher_training_curriculum, :mandatory => true)

education1  = Course.create!(:name => "Education Basics", :teacher => education_prof)
education2  = Course.create!(:name => "Advanced Education", :teacher => education_prof)
education1.ects_modules << education
education2.ects_modules << education
Course::Component.create!(:course =>  education1, :type => :lecture, :teacher => education_prof, :dates => 1, :double_lecture => false, :participants => 30)
Course::Component.create!(:course =>  education2, :type => :lecture, :teacher => education_prof, :dates => 1, :double_lecture => false, :participants => 30)

Recommendation.create!(:curriculum => teacher_training_curriculum, :course => education1, :semester => 1)
Recommendation.create!(:curriculum => teacher_training_curriculum, :course => education2, :semester => 2)
TimeWindow.create!(:curriculum => teacher_training_curriculum, :weekday => monday, :timeframe => Timeframe.first, :semester => 1)
TimeWindow.create!(:curriculum => teacher_training_curriculum, :weekday => tuesday, :timeframe => Timeframe.second, :semester => 2)

long_course  = Course.create!(:name => "Long Course", :teacher => education_prof)
long_module = EctsModule.create!(:name => "Long Module")
CurriculumModuleAssignment.create!(:ects_module => long_module, :curriculum => teacher_training_curriculum, :mandatory => false)
long_course.ects_modules << long_module
Course::Component.create!(:course =>  long_course, :type => :tutorial, :teacher => education_prof, :dates => 2, :double_lecture => true, :participants => 40)

# Room unavailabilities and properties
Room::Unavailability.create!(:room => h01, :weekday => monday, :timeframe => eight_o_clock)
Room::Unavailability.create!(:room => h01, :weekday => tuesday, :timeframe => eight_o_clock)
Room::Unavailability.create!(:room => h01, :weekday => wednesday, :timeframe => eight_o_clock)

computer_pool = Room::Property.create(:name => "Computer pool")

room_3.properties << computer_pool
room_4.properties << computer_pool
java_programming.components.first.required_room_properties << computer_pool
ruby_programming.components.first.required_room_properties << computer_pool
python_programming.components.first.required_room_properties << computer_pool

# Teacher unavailabilities
[monday, tuesday].each do |w|
  Timeframe.all.each do |t|
    Teacher::Unavailability.create!(:teacher => programming_prof, :weekday => w, :timeframe => t)
  end
end

# Curriculum unavailabiliites
[monday, tuesday, wednesday].each do |w|
  Curriculum::Unavailability.create!(:curriculum => teacher_training_curriculum, :weekday => w, :timeframe => Timeframe.first)
end

# ects_module1 =  EctsModule.create!(:name => "Grundlagen der Programmierung")
# curricula1 =  Curriculum.create!(:name => "Informatik Bachelor")
# curricula1.ects_modules << ects_module1 


