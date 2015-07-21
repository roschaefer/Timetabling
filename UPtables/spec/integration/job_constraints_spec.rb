require 'rails_helper'
describe Timetabling::Job do

  subject(:job) { Timetabling::Job.new }

  describe "#teacher_availability" do
    let(:expected_string) {":- assigned(C,_,WD,TF), course_component(C,T,_,_,_,_), professor_unavailable(T,WD,TF)." }
    it "asp_representation is correct" do
      expect(job.teacher_availability.asp_representation).to eq expected_string
    end


    it "is active by default" do
      job.solve
      expect(job.problem.asp_representation).to include("professor_unavailable")
    end

    it "can be deactivated along with committee_date" do
      job.constraint_methods[:teacher_availability] = false
      job.constraint_methods[:committee_date] = false
      job.solve
      expect(job.problem.asp_representation).not_to include("professor_unavailable")
    end
  end

  describe "#room_availability" do
    let(:expected_string) { ":- assigned(_,ROOM_ID0,WEEKDAY_ID1,TIMEFRAME_ID2), room_unavailable(ROOM_ID0,WEEKDAY_ID1,TIMEFRAME_ID2)." }
    it "asp_representation is correct" do
      expect(job.room_availability.asp_representation).to eq expected_string
    end

    it "is active by default" do 
      expect(job.constraint_methods[:room_availability]).to be_truthy
    end
  end

  describe "#committee_date" do
    let(:expected_string) { "committee_date(WD,TF) :- timeframe(TF,_), weekday(WD,_), not assigned(_,_,WD,TF), not professor_unavailable(_,WD,TF).\n:- not committee_date(_,_)." }

    it "asp_representation is correct" do
      expect(job.committee_date.asp_representation).to eq expected_string
    end
    it "is inactive by default" do 
      expect(job.constraint_methods[:committee_date]).to be_falsey
    end
  end

  describe "#same_curriculum_and_mandatory" do
    let(:expected_string) { "#minimize {C,N,V : penalty(N,V,C)}.\n#const costs_of_same_curriculum_and_mandatory = 1.\npenalty(\"same_curriculum_and_mandatory\", same_curriculum_and_mandatory(), costs_of_same_curriculum_and_mandatory) :- assigned(C1,_,WD,TF), assigned(C2,_,WD,TF), mandatory(C1,Cu), mandatory(C2,Cu), C1 != C2." }

    it "asp_representation is correct" do
      expect(job.same_curriculum_and_mandatory.asp_representation).to eq expected_string
    end

    it "is active by default" do
      expect(job.constraint_methods[:same_curriculum_and_mandatory]).to be_truthy
    end

  end

  describe "#generate_solution_space" do
    let(:expected_string) { 'N { assigned(C,WD,TF) : weekday(WD,_), timeframe(TF,_) } N :- course_component(C,_,N,_,_,_).' }

    it "generates the solution space" do
      expect(job.generate_solution_space.asp_representation).to eq expected_string
    end
  end


end
