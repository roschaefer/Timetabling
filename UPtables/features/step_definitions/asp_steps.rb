def job
  @job ||= Timetabling::Job.new
end

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

Angenommen(/^der Kurs ist im (\d+)\. Semester empfohlen$/) do |semester|
  curriculum = @course.curricula.first
  create :recommendation, :course => @course, :curriculum => curriculum, :semester => semester
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

Angenommen(/^der Kurs ist im Studiengang "(.*?)" Pflicht$/) do |curriculum_name|
  curriculum = Curriculum.find_by :name => curriculum_name
  create_mandatory_module_for(@course, curriculum)
end

Dann(/^diese Lösung hat sogar gar keine Kosten, weil es keine Überschneidungen gibt$/) do
  expect(Timetable.first.costs).to eq 0
end

Angenommen(/^für diesen Test deaktivieren wir die Soft Constraints$/) do
  job.optimize = false
end

Wenn(/^jetzt nach Stundenplänen gesucht wird$/) do
  job.run
end

Dann(/^gibt es (\d+) Lösungen/) do |n|
  expect(Timetable.all).to have(n.to_i).items
end

Dann(/^(?:gibt es|es gibt)(?: nur noch)? (\d+) optimale Lösungen/) do |n|
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
    create(:course_component, :course => course, :dates => 1, :type => :lecture)
  end
end

Angenommen(/^alle Kurse haben eine wöchentliche Übung$/) do
  @courses.each do |course|
    create(:course_component, :course => course, :dates => 1, :type => :tutorial)
  end
end

Angenommen(/^der Kurs hat (\d+) Übungen pro Woche$/) do |dates|
  create(:course_component, :course => @course, :dates => dates.to_i, :type => :tutorial)
end

Angenommen(/^die Kurse haben (\d+) Übungen pro Woche$/) do |dates|
  @courses.each do |c|
    create(:course_component, :course => c, :dates => dates.to_i, :type => :tutorial)
  end
end

Angenommen(/^die Vorlesung wird von Prof. "(.*?)" gehalten$/) do |teacher_surname|
  teacher = create(:teacher, :surname => teacher_surname)
  lecture = Course::Component.where(:course => @course, :type => :lecture).first
  lecture.teacher = teacher
  lecture.save
end

Angenommen(/^die Vorlesung für "(.*?)" wird von Prof\. "(.*?)" gehalten$/) do |course_name, teacher_surname|
  @course = Course.find_by(:name => course_name)
  step "die Vorlesung wird von Prof. \"#{teacher_surname}\" gehalten"
end

Angenommen(/^der Kurs hat eine Vorlesung die einmal pro Woche stattfindet$/) do
  create(:course_component, :course => @course, :dates => 1, :type => :lecture)
end

Angenommen(/^der Kurs "(.*?)" hat eine Vorlesung die einmal pro Woche stattfindet$/) do |course_name|
  course = Course.find_by!(:name => course_name)
  create(:course_component, :course => course, :dates => 1, :type => :lecture)
end

Angenommen(/^der Kurs "(.*?)" hat eine Übung die einmal pro Woche stattfindet$/) do |course_name|
  course = Course.find_by!(:name => course_name)
  create(:course_component, :course => course, :dates => 1, :type => :tutorial)
end

Angenommen(/^der Kurs "(.*?)" hat eine Vorlesung die zweimal pro Woche stattfindet$/) do |course_name|
  course = Course.find_by!(:name => course_name)
  create(:course_component, :course => course, :dates => 2, :type => :lecture)
end

Angenommen(/^der Kurs hat zwei wöchentliche Vorlesungen, zusammen als Doppelstunde stattfinden sollen$/) do
  create(:course_component, :course => @course, :dates => 2, :type => :lecture, :double_lecture => true)
end

Angenommen(/^der Kurs hat drei wöchentliche Vorlesungen insgesamt, die nicht einzeln stattfinden sollen$/) do
  create(:course_component, :course => @course, :dates => 3, :type => :lecture, :double_lecture => true)
end

Angenommen(/^der Kurs hat vier Vorlesungen insgesamt, die als Doppelstunden stattfinden$/) do
  create(:course_component, :course => @course, :dates => 4, :type => :lecture, :double_lecture => true)
end

Dann(/^sehen die Raumbelegungen so aus:$/) do |table|
  # TODO: this step definition works only with one room and only one course
  room_1_column = table.rows.transpose[2] # TODO: how about more rooms?
  expect(@solutions).to allocate_rooms_like room_1_column
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
  create(:course_component, :course => @course, :dates =>1, :participants => participants.to_i, :type => :tutorial)
end

Angenommen(/^der Kurs "(.*?)" hat eine wöchentliche Übung$/) do |course_name|
  course = Course.find_by!(:name => course_name)
  create(:course_component, :course => course, :dates =>1, :type => :tutorial)
end

Angenommen(/^es gibt Kosten von (\d+) für Konflikte bei gleicher Semesterempfehlung$/) do |cost|
  # TODO: set the costs for a this soft constraint to the given parameter
  # currently the default is just 7
  expect(cost.to_i).to eq 7
end

Wenn(/^(?:wenn )?die gefundenen, optimalen Lösungen sortiert werden$/) do
  @solutions = Timetable.optimal.map {|t| TimetablePresenter.new(t)}
  @solutions.sort!
end

Dann(/^sieht die erste Lösung so aus:$/) do |table|
  # for what reason this doesn't work?
  # table.diff!(@solutions.first.ast_table)
  expect(@solutions.first.ast_table.raw).to eq table.raw
end

Angenommen(/^wir aktivieren den Constraint für Gremientage$/) do
  job.constraint_methods[:committee_date] = true
end

Dann(/^(?:es gibt|gibt es)? bei der ersten Lösung einen Gremiumtag am (.+) (.+)$/) do |weekday, interval|
  weekday = Weekday.find_by!(:name => weekday)
  timeframe = Timeframe.find_by!(:interval => interval)
  timetable = @solutions.first.timetable
  expected = build(:committee_date, :timetable => timetable, :weekday => weekday, :timeframe => timeframe)
  expect(timetable.committee_dates.find{|cd| cd.weekday == expected.weekday && cd.timeframe == expected.timeframe}).not_to be_nil
end

