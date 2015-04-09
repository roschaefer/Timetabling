def fill_in_many_fields(hashes)
  hashes.each do |key, value|
    fill_in key, :with => value
  end
end

def many_to_many_table(table, &block)
  (1..(table.raw.size - 1)).each do |i|
    row = table.raw[i]
    (1..(row.size - 1)).each do |j|
      cell = row[j]
      if (cell =~ /X/)
        block.call(row[0], table.raw[0][j])
      end
    end
  end
end

def course_belongs_to_curriculum(course, curriculum)
  ects_module = create(:ects_module)
  course.ects_modules << ects_module
  curriculum.ects_modules << ects_module
end

Angenommen(/^es gibt einen Kurs/) do
  create :course
end

Angenommen(/^es gibt noch einen anderen Lehrer in der Datenbank$/) do
  @another_teacher = create :teacher, :first_name => "I am another", :surname => "Teacher"
end

Wenn(/^ich auf die Seite vom Kurs gehe$/) do
  visit edit_course_path(Course.first)
end

Wenn(/^den ursprünglichen Lehrer gegen den anderen austausche$/) do
  page.select @another_teacher.full_name, :from => "course[teacher_id]"
  click_button 'Save'
end

Dann(/^sollte der Kurs in der Datenbank dem neuen Lehrer zugeordnet sein$/) do
  expect(Course.first.teacher).to eq @another_teacher
end


Angenommen(/^es gibt noch keinen Raum in der Datenbank$/) do
  expect(Room.count).to eq 0
end

Wenn(/^ich einen neuen Raum erzeugen will$/) do
  visit new_room_path
end

Wenn(/^ich diese Daten eintrage und speichere$/) do |table|
  fill_in_many_fields table.rows_hash
  click_button 'Save'
end

Dann(/^gibt es genau einen Raum in der Datenbank$/) do
  expect(Room.count).to eq 1
end

Dann(/^dieser Raum hat (\d+) Sitzplätze$/) do |capacity|
  expect(Room.first.capacity).to eq capacity.to_i
end


Angenommen(/^es gibt die Wochentage (?:(.*),)* (.*) und (.*)$/) do |first_weekdays, second_last, last|
    weekdays = first_weekdays.split(",").map(&:strip) + [second_last] + [last]
    weekdays.each {|w| create :weekday, :name => w }
end

Angenommen(/^es gibt die Zeitslots$/) do |table|
  table.rows.each {|r| create :timeframe, :interval => r[0]}
end

Angenommen(/^ich habe .+ im Zweitzugriffsrecht für (.*) um (.*) Uhr bekommen$/) do |weekday, timeframe|
  # do nothing :)
end

Wenn(/^ich .+ als Raum hinzufügen möchte$/) do
  visit new_room_path
end

Wenn(/^ich diese Daten eintrage$/) do |table|
  fill_in_many_fields table.rows_hash
end

Wenn(/^außerdem diese Unverfügbarkeiten angebe$/) do |table|
  table.rows.each_with_index do |r, i|
    r.slice(1, (r.size - 1)).each_with_index do |cell, j|
      if ( cell =~ /X/ )
        timeframe_i = i + 1 # default id sequence start with 1 in rails
        weekday_i   = j + 1
        find(:css, "#room_unavailability_ids_[value='#{weekday_i} #{timeframe_i}']").set(true)
      end
    end
  end
end

Wenn(/^dann speichere$/) do
  click_button 'Save'
end

Dann(/^sollte der Raum (.+) genau (\d+) Plätze haben$/) do |room, seats|
  @room = Room.where(:name => room).first
  expect(@room.capacity).to eq seats.to_i
end

Dann(/^er ist frei am (.+) zwischen (.+) und (.+) Uhr$/) do |weekday, from, to|
  w = Weekday.where(:name => weekday).first
  t = Timeframe.where(:interval=> "#{from} - #{to}").first
  expect(@room).to be_available_at w, t
end

Dann(/^er ist belegt am (.+) zwischen (.+) und (.+) Uhr$/) do |weekday, from, to|
  w = Weekday.where(:name => weekday).first
  t = Timeframe.where(:interval=> "#{from} - #{to}").first
  expect(@room).not_to be_available_at w, t
end

Angenommen(/^es gibt den Kurs "(.*?)"$/) do |name|
  @course = create :course, :name => name
end

Angenommen(/^es gibt die Studienordnungen (?:"(.*)",)* "(.*)" und "(.*)"$/) do |first_curricula, second_last, last|
  curricula = first_curricula.split(",").map(&:strip) + [second_last] + [last]
  curricula.each {|c| create :curriculum, :name => c }
end

Angenommen(/^der Kurs gehört zum Studiengang "(.*?)"$/) do |curriculum_name|
  curriculum = Curriculum.find_by(:name => curriculum_name)
  course_belongs_to_curriculum(@course, curriculum)
end

Angenommen(/^der Kurs "(.*?)" gehört zum Studiengang "(.*?)"$/) do |course_name, curriculum_name|
  course = Course.find_by!(:name => course_name)
  curriculum = Curriculum.find_by(:name => curriculum_name)
  course_belongs_to_curriculum(course, curriculum)
end


Angenommen(/^es gibt die Module "(.*?)" und "(.*?)"$/) do |module1, module2|
  create :ects_module, :name => module1
  create :ects_module, :name => module2
end

Angenommen(/^die Zuordnung von Lehrveranstaltungen und Modulen sieht so aus:$/) do |table|
  many_to_many_table(table) do | left_side, right_side|
    course      = Course.find_by!(:name     => left_side)
    ects_module = EctsModule.find_by!(:name => right_side)
    course.ects_modules << ects_module
  end
end

Angenommen(/^die Zuordnung von Modulen und Studienordnungen sieht so aus:$/) do |table|
  many_to_many_table(table) do | left_side, right_side|
    ects_module = EctsModule.find_by!(:name => left_side)
    curriculum  = Curriculum.find_by!(:name => right_side)
    curriculum.ects_modules << ects_module
  end
end

Wenn(/^ich auf die Seite des Kurses gehe$/) do
  visit course_path(@course)
end

Dann(/^möchte ich die Studienordnungen (?:"(.*)",)* "(.*)" und "(.*)" sehen$/) do |first_curricula, second_last, last|
  curricula = first_curricula.split(",").map(&:strip) + [second_last] + [last]
  curricula.each {|c| expect(page).to have_content(c) }
end

Angenommen(/^es gibt (\d+) Räume mit jeweils (\d+) Plätzen in der Datenbank$/) do |number_of_rooms, number_of_seats|
  number_of_rooms.to_i.times do
    create :room, :capacity => number_of_seats
  end
end

Angenommen(/^es gibt (\d+) Kurse in der Datenbank$/) do |number_of_courses|
  number_of_courses.to_i.times do
    create :course_with_component
  end
end

Angenommen(/^alle Kurse gehören zur selben Studienordnung$/) do
  curriculum  = create :curriculum
  Course.find_each do |c|
    ects_module = create :ects_module
    curriculum.ects_modules << ects_module
    c.ects_modules << ects_module
  end
end

Wenn(/^ich auf die Stundenplan Seite gehe$/) do
  visit timetables_path
end

Wenn(/^ich einen Time out von einer Sekunde einstelle$/) do
  fill_in :time_out, :with => 1
end

Wenn(/^die Suche starte$/) do
  @seach_started = Time.now
  click_button "Solve!"
end

Dann(/^habe ich nach kaum mehr als einer Sekunde schon Ergebnisse$/) do
  all ".timetable"
  expect(Time.now - @seach_started).to be < 2.seconds
end

Dann(/^wie ich sehe, wurde keine optimale Lösung gefunden$/) do
  expect(page).to have_css(".timed-out")
end

Angenommen(/^es gibt die Studienordnung "(.*?)"$/) do |curriculum|
  @curriculum = create(:curriculum, :name => curriculum)
end

Angenommen(/^der Kurs gehört zur Studienordnung "(.*?)"$/) do |curriculum|
  ects_module = create(:ects_module)
  @course.ects_modules << ects_module
  Curriculum.find_by!(:name => curriculum).ects_modules << ects_module
end

Wenn(/^ich den Kurs bearbeiten möchte$/) do
  visit edit_course_path(@course)
end

Dann(/^ist in der Datenbank der Kurs im zweiten Semester für diese Studienordnung empfohlen$/) do
  pending # express the regexp above with the code you wish you had
end

def recommend(n, curriculum, semester)
  click_link "Add recommendation"
  all(".select_box_for_curricula")[n].select(curriculum)
  all(".semester")[n].set(semester)
end

Wenn(/^den Kurs für die Studienordnung "(.*?)" im (\d+)\. Semester empfehle$/) do |curriculum, semester|
  recommend(0, curriculum, semester)
end

Wenn(/^den Kurs für die Studienordnung "(.*?)" auch im (\d+)\. Semester empfehle$/) do |curriculum, semester|
  recommend(1, curriculum, semester)
end

Wenn(/^dann versuche zu speichern$/) do
  click_button "Save"
end

Dann(/^ist in der Datenbank der Kurs im (\d+)\. Semester im Studiengang "(.*?)" empfohlen$/) do |semester, curriculum|
  find "#notice" # wait for update
  @course.reload
  expect(@course.recommendations.first.semester).to eq semester.to_i
  expect(@course.recommendations.first.curriculum.name).to eq curriculum
end

Dann(/^sehe ich Validierungsfehler$/) do
  expect(page).to have_text("error")
end

Dann(/^der Kurs hat keine Empfehlung für irgendeine Studienordnung$/) do
  @course.reload
  expect(@course.recommendations).to be_empty
end

Wenn(/^es keine Stundenpläne gibt$/) do
  expect(Timetable.count).to eq 0
end

Dann(/^sollte auch keine Meldung vorhanden sein, dass keine optimale Lösung gefunden wurde$/) do
  expect(page).not_to have_css(".timed-out")
end

Wenn(/^ich die Studienordnung editiere$/) do
  visit edit_curriculum_path(@curriculum)
end

Wenn(/^ich diese Sperrzeiten für die Studienordnung angebe$/) do |table|
  table.rows.each_with_index do |r, i|
    r.slice(1, (r.size - 1)).each_with_index do |cell, j|
      if ( cell =~ /X/ )
        timeframe_i = i + 1 # default id sequence start with 1 in rails
        weekday_i   = j + 1
        find(:css, "#curriculum_unavailability_ids_[value='#{weekday_i} #{timeframe_i}']").set(true)
      end
    end
  end
end

Dann(/^dürfen Kurse dieser Studienordnung auf den ganzen (.*) gelegt werden$/) do |weekday_name|
  weekday = Weekday.find_by :name => weekday_name
  Timeframe.all do |timeframe|
    expect(@curriculum).to be_available_at(weekday, timeframe)
  end
end

Dann(/^es dürfen keine Kurse am (.*) um (.*) Uhr stattfinden$/) do |weekday_name, interval|
  weekday   = Weekday.find_by(:name => weekday_name)
  timeframe = Timeframe.find_by(:interval => interval)
  expect(@curriculum).not_to be_available_at(weekday, timeframe)
end

Angenommen(/^keine Studienordnung hat irgendwelche Sperrzeiten$/) do
  expect(Curriculum::Unavailability.count).to eq 0
end

Angenommen(/^Prof. "(.*?)" hat keine Unverfügbarkeiten$/) do |teacher_surname|
  teacher = Teacher.find_by!(:surname => teacher_surname)
  expect(teacher.unavailabilities.count).to eq 0
end


Angenommen(/^der Studiengang "(.*?)" hat eine Sperrzeit am (.*?) um (.*?) Uhr$/) do |curriculum_name, weekday_name, interval|
  curriculum = Curriculum.find_by!(:name => curriculum_name)
  weekday   = Weekday.find_by!(:name   => weekday_name)
  timeframe = Timeframe.find_by!(:interval => interval)
  create(:curriculum_unavailability, :curriculum => curriculum, :weekday => weekday, :timeframe => timeframe)
end

Angenommen(/^Prof. "(.*?)" ist am (.*?) um (.*?) Uhr unverfügbar$/) do |teacher_surname, weekday_name, interval|
  teacher = Teacher.find_by!(:surname => teacher_surname)
  weekday   = Weekday.find_by!(:name   => weekday_name)
  timeframe = Timeframe.find_by!(:interval => interval)
  create(:teacher_unavailability, :teacher => teacher, :weekday => weekday, :timeframe => timeframe)
end

Dann(/^es ich kann mir den ersten Stundenplan ansehen$/) do
  visit show_timetable_path(1)
end

