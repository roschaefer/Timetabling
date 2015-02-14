require 'rails_helper'
describe Asp::Job do
  subject(:job) { Asp::Job.new }

  describe "#run" do
    subject(:run) { job.run }
    context "with a single-slot timetable" do
      before {
        create :weekday
        create :timeframe
      }

      it "and one course and one room yields one timetable with exactly one entry" do
        create :room
        create :course
        expect { run }.to change { [Timetable.count, Timetable::Entry.count] }.from([0,0]).to([1,1])
      end

      it "and two courses and only one room is unsatisfiable" do
        create :room
        create :course
        create :course
        expect { run }.not_to change { [Timetable.count, Timetable::Entry.count] }
      end
    end

  end
end

