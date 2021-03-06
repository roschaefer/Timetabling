require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { create :course, course_attributes}
  let(:teacher) { create :teacher, teacher_attributes }

  describe "#asp_representation" do
    let(:teacher_attributes) {{
      :id => 21,
      :first_name => "Horst",
      :surname => "Voigt"
    }}
    let(:course_attributes) { {
      :id                   => 9,
      :name                 => "Informatik für Naturwissenschaftler I Vorlesung",
      :teacher              => teacher
    }}

    it "returns a valid asp fact" do
      expect(course.asp_representation).to eq "course(course_9,teacher_21)."
    end
  end
end


