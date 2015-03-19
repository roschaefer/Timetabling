require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { create :course, course_attributes}
  let(:teacher) { create :teacher, teacher_attributes }

  describe "#to_fact" do
    let(:teacher_attributes) {{
      :id => 21,
      :first_name => "Horst",
      :surname => "Voigt"
    }}
    let(:course_attributes) { {
      :id                   => 9,
      :name                 => "Informatik für Naturwissenschaftler I Vorlesung",
      :teacher              => teacher,
      :participants         => 90
    } }

    it "returns a valid asp fact" do
      expect(course.to_fact).to eq "course(9,21,90)."
    end
  end
end
