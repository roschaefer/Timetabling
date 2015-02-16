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
