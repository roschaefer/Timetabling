require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { create :course, course_attributes}
  let(:teacher) { create :teacher, teacher_attributes }
  describe "#to_fact" do
    let(:teacher_attributes) {{
      :first_name => "Horst",
      :surname => "Voigt"
    }}
    let(:course_attributes) { {
      :name                 => "Informatik für Naturwissenschaftler I Vorlesung",
      :teacher              => teacher,
      :dates                => 1,
      :minimum_working_days => 1,
      :participants         => 90,
      :double_lecture       => false
    } }

    it "returns a valid asp fact" do
      expect(course.to_fact).to eq "course(\"Informatik für Naturwissenschaftler I Vorlesung\",\"Horst Voigt\",1,1,90,0)."
    end
  end
end
