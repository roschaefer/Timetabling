Angenommen(/^es gibt einen Kurs/) do
  create :course
end

Angenommen(/^es gibt noch einen anderen Lehrer in der Datenbank$/) do
  @another_teacher = create :teacher
end

Wenn(/^ich auf die Seite vom Kurs gehe$/) do
  visit course_path(Course.first)
end

Wenn(/^den ursprünglichen Lehrer gegen den anderen austausche$/) do
  page.select @another_teacher.name, :from => 'Teacher'
end

Dann(/^sollte der Kurs in der Datenbank dem neuen Lehrer zugeordnet sein$/) do
  expect(Course.first.teacher).to be @another_teacher
end
