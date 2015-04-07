Angenommen(/^unser Stundenplan sieht so aus:$/) do |table|
  header_rows = []
  header_rows[0] = table.raw[0] ; header_rows[0].shift(2) # skip first two cells
  header_rows[1] = table.raw[1] ; header_rows[1].shift(2) # skip first two cells
  rooms = header_rows[0].zip(header_rows[1])
  rooms.each {|r| create :room, :name => r[0], :capacity => r[1]}

  weekdays = table.raw.collect {|row| row[0] }
  weekdays.shift(2) # skip first two rows
  weekdays.uniq!
  timeframes = table.raw.collect {|row| row[1] }
  timeframes.shift(2) # skip first two rows
  timeframes.uniq!

  weekdays.each_with_index   {|w, i| create :weekday, :name => w, :id => i }
  timeframes.each_with_index {|t, i| create :timeframe, :interval => t, :id => i }
end

Angenommen(/^es gibt die zwei Studienordnungen "(.*?)" und "(.*?)"$/) do |curriculum1, curriculum2|
  create :curriculum, :name => curriculum1
  create :curriculum, :name => curriculum2
end

Angenommen(/^es gibt die Kurse "(.*?)" und "(.*?)"$/) do |course1, course2|
  @courses = []
  @courses << create(:course, :name => course1)
  @courses << create(:course, :name => course2)
end

def create_mandatory_module_for(course, curriculum)
  ects_module = create(:ects_module)
  course.ects_modules << ects_module
  create :curriculum_module_assignment, :curriculum => curriculum, :ects_module => ects_module, :mandatory => true
end

def create_elective_module_for(course, curriculum)
  ects_module = create(:ects_module)
  course.ects_modules << ects_module
  create :curriculum_module_assignment, :curriculum => curriculum, :ects_module => ects_module, :mandatory => false
end

Angenommen(/^die Kurse sind beides Pflichtveranstaltungen im Studiengang "(.*?)"$/) do |curriculum_name|
  curriculum = Curriculum.find_by :name => curriculum_name
  @courses.each do |c|
    create_mandatory_module_for(c, curriculum)
  end
end

Angenommen(/^die Kurse gehören jeweils durch ein Wahlmodul zum Studiengang "(.*?)"$/) do |curriculum_name|
  curriculum = Curriculum.find_by :name => curriculum_name
  @courses.each do |c|
    create_elective_module_for(c, curriculum)
  end
end

Angenommen(/^der Kurs "(.*?)" gehört durch ein Wahlmodul zum Studiengang "(.*?)"$/) do |course_name, curriculum_name|
  course = Course.find_by :name => course_name
  curriculum = Curriculum.find_by :name => curriculum_name
  create_elective_module_for(course, curriculum)
end

Angenommen(/^die Kurse sind beide im (\d+)\. Semester empfohlen$/) do |semester|
  @courses.each do |c|
    curriculum = c.curricula.first
    create :recommendation, :course => c, :curriculum => curriculum, :semester => semester
  end
end

Dann(/^gibt es keine Lösung/) do
  expect(Timetable.all).to have(0).items
end

Angenommen(/^der Kurs "(.*?)" ist im (\d+)\. Semester empfohlen$/) do |course_name, semester|
  course = Course.find_by :name => course_name
  curriculum = course.curricula.first
  create :recommendation, :course => course, :curriculum => curriculum, :semester => semester
end

Angenommen(/^der Kurs besitzt eine Komponente vom Typ "(.*?)" mit genau (\d+) Termin$/) do |component_type, component_dates|
  course_component = create(:course_component, :id => @course.id + 1 ,:type => component_type, :dates => component_dates)
  @course.components = [course_component]
end

Angenommen(/^der Kurs "(.*?)" besitzt eine Komponente vom Typ "(.*?)" mit genau (\d+) Termin$/) do |course_name, component_type, component_dates|
  course     = Course.find_by :name     => course_name
  course_component = create(:course_component, :id => course.id + 1 ,:type => component_type, :dates => component_dates)
  course.components = [course_component]
end

Dann(/^gibt es genau eine Lösung/) do
  expect(Timetable.all).to have(1).item
end

Dann(/^gibt es genau eine optimale Lösung/) do
  expect(Timetable.optimal).to have(1).item
end

Dann(/^diese Lösung hat gewisse Kosten wegen Überschneidungen im gleichen Studiengang$/) do
  expect(Timetable.first.costs).to be > 0
end

Angenommen(/^der Kurs "(.*?)" ist im Studiengang "(.*?)" Pflicht$/) do |course_name, curriculum_name|
  course     = Course.find_by :name     => course_name
  curriculum = Curriculum.find_by :name => curriculum_name
  create_mandatory_module_for(course, curriculum)
end

Dann(/^diese Lösung hat sogar gar keine Kosten, weil es keine Überschneidungen gibt$/) do
  expect(Timetable.first.costs).to eq 0
end

Angenommen(/^für diesen Test deaktivieren wir die Soft Constraints$/) do
  @job = Asp::Job.new
  @job.optimize = false
end

Wenn(/^jetzt nach Stundenplänen gesucht wird$/) do
  @job ||= Asp::Job.new
  @job.run
end

Dann(/^gibt es (\d+) Lösungen/) do |n|
  expect(Timetable.all).to have(n.to_i).items
end

Dann(/^gibt es(?: nur noch)? (\d+) optimale Lösungen/) do |n|
  expect(Timetable.optimal).to have(n.to_i).items
end

Dann(/^es gibt(?: sogar)? optimale Lösungen ohne Kosten/) do
  expect(Timetable.optimal.first.costs).to eq 0
end

Dann(/^die Kosten für optimale Lösungen betragen (\d+)/) do |costs|
  expect(Timetable.optimal.first.costs).to eq costs.to_i
end

Dann(/^leider haben optimale Lösungen(?: auf jeden Fall)? Kosten/) do
  expect(Timetable.optimal.first.costs).to be > 0
end


Angenommen(/^alle Kurse haben eine wöchentliche Vorlesung$/) do
  @courses.each do |course|
    create(:course_component, :course => course, :dates => 1, :type => 'Vorlesung')
  end
end

Angenommen(/^die Vorlesung des Kurses "(.*?)" hat einen Termin und wird von Prof. "(.*?)" unterrichtet$/) do |course_name, teacher_surname|
  course = Course.find_by!(:name => course_name)
  teacher = create(:teacher, :surname => teacher_surname)
  lecture = create(:course_component, :type => "Vorlesung", :dates => 1, :teacher => teacher)
  course.components = [lecture]
  course.save
end

Angenommen(/^der Kurs hat eine Vorlesung die einmal pro Woche stattfindet$/) do
  create(:course_component, :course => @course, :dates => 1, :type => 'Vorlesung')
end

Angenommen(/^der Kurs "(.*?)" hat eine Vorlesung die einmal pro Woche stattfindet$/) do |course_name|
  course = Course.find_by!(:name => course_name)
  create(:course_component, :course => course, :dates => 1, :type => 'Vorlesung')
end

Angenommen(/^der Kurs hat zwei wöchentliche Vorlesungen, zusammen als Doppelstunde stattfinden sollen$/) do
  create(:course_component, :course => @course, :dates => 2, :type => 'Vorlesung', :double_lecture => true)
end

Angenommen(/^der Kurs hat drei wöchentliche Vorlesungen insgesamt, die nicht einzeln stattfinden sollen$/) do
  create(:course_component, :course => @course, :dates => 3, :type => 'Vorlesung', :double_lecture => true)
end

Angenommen(/^der Kurs hat vier Vorlesungen insgesamt, die als Doppelstunden stattfinden$/) do
  create(:course_component, :course => @course, :dates => 4, :type => 'Vorlesung', :double_lecture => true)
end

Dann(/^so sehen die Raumbelegungen aus:$/) do |table|
  # pending
  # nope, no implementation here, but it would be great to have one
  # the numbers in one room column of the table encode the id of a solution
  # (hence a timetable)
end

Angenommen(/^es gibt (\d+) Kurse ohne Komponenten in der Datenbank$/) do |number|
  number.to_i.times  { create(:course) }
end

Angenommen(/^der Kurs muss in einem Raum stattfinden, der mit einem Beamer ausgestattet ist$/) do
  property = create(:room_property, :name => "Beamer")
  component = @course.components.first!
  component.required_room_properties << property
end

Angenommen(/^(.+) ist mit einem Beamer ausgestattet$/) do |room_name|
  room = Room.find_by!(:name => room_name)
  beamer_property = Room::Property.find_by!(:name => "Beamer")
  room.properties << beamer_property
end

Angenommen(/^der Kurs muss in einem Raum stattfinden, der über Computerarbeitsplätze verfügt$/) do
  property = create(:room_property, :name => "Computer pool")
  @course.components.first.required_room_properties << property
end

Angenommen(/^(.+) ist mit Computerarbeitsplätzen ausgestattet$/) do |room_name|
  room = Room.find_by!(:name => room_name)
  computer_property = Room::Property.find_by!(:name => "Computer pool")
  room.properties << computer_property
end

Angenommen(/^der Kurs hat eine wöchentliche Übung mit (\d+) Teilnehmern$/) do |participants|
  create(:course_component, :course => @course, :dates =>1, :participants => participants.to_i, :type => 'Übung')
end

Angenommen(/^es gibt Kosten von (\d+) für Konflikte bei gleicher Semesterempfehlung$/) do |cost|
  # TODO: set the costs for a this soft constraint to the given parameter
  # currently the default is just 7
  expect(cost.to_i).to eq 7
end
