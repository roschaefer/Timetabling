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
        check "unavailability[#{weekday_i}][#{timeframe_i}]"
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

