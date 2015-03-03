Angenommen(/^unser Stundenplan sieht so aus:$/) do |table|
  header_rows = []
  header_rows[0] = table.raw[0] ; header_rows[0].shift(2) # skip first two cells
  header_rows[1] = table.raw[1] ; header_rows[1].shift(2) # skip first two cells
  rooms = header_rows[0].zip(header_rows[1])
  rooms.each {|r| create :room, :name => r[0], :capacity => r[1]}

  weekdays = table.raw.collect {|row| row[0] }
  weekdays.shift(2) # skip first two rows
  timeframes = table.raw.collect {|row| row[1] }
  timeframes.shift(2) # skip first two rows

  weekdays.each   {|w| create :weekday, :name => w }
  timeframes.each {|t| create :timeframe, :interval => t }
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
  # TODO: implemenet mandatory functionality here
  curriculum.ects_modules << ects_module
end

Angenommen(/^die Kurse sind beides Pflichtveranstaltungen im Studiengang "(.*?)"$/) do |curriculum_name|
  curriculum = Curriculum.find_by :name => curriculum_name
  @courses.each do |c|
    create_mandatory_module_for(c, curriculum)
  end
end

Angenommen(/^die Kurse sind beide im (\d+)\. Semester empfohlen$/) do |semester|
  @courses.each do |c|
    curriculum = c.curricula.first
    create :recommendation, :course => c, :curriculum => curriculum, :semester => semester
  end
end

Dann(/^gibt es keine Lösung, weil sich die Kurse nicht überschneiden dürfen$/) do
  job = Asp::Job.new
  job.run
  expect(Timetable.all).to be_empty
end

Angenommen(/^der Kurs "(.*?)" ist im (\d+)\. Semester empfohlen$/) do |course_name, semester|
  course = Course.find_by :name => course_name
  curriculum = course.curricula.first
  create :recommendation, :course => course, :curriculum => curriculum, :semester => semester
end

Dann(/^gibt es genau eine Lösung$/) do
  expect(Timetable.all).to have(1).item
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
