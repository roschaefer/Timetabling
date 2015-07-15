require 'rails_helper'
describe Timetabling::Job do

  subject(:job) { Timetabling::Job.new }

  describe "#availability" do
    let(:expected_availability_constraint) {":- assigned(C,_,WD,TF), course_component(C,T,_,_,_,_), professor_unavailable(T,WD,TF)." }
    it "#availability" do
         expect(job.availability.asp_representation).to eq expected_availability_constraint
    end
  end


end
