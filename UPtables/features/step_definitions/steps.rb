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
  options = table.rows_hash
  fill_in "Name", :with => options["Name"]
  fill_in "Capacity", :with => options["Capacity"]
  click_button 'Save'
end

Dann(/^gibt es genau einen Raum in der Datenbank$/) do
  expect(Room.count).to eq 1
end

Dann(/^dieser Raum hat (\d+) Sitzplätze$/) do |capacity|
  expect(Room.first.capacity).to eq capacity.to_i
end
