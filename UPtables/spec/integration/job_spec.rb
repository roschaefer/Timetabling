require 'rails_helper'
describe Asp::Job do
  subject(:job) { Asp::Job.new }

  describe "#run" do
    subject(:run) { job.run }

    context "with soft and hard constraints" do
      #before { job.configuration = Asp::Configuration.default }
      it "creates timetables with costs" do
        create :weekday
        create :timeframe
        create :room
        create :course
        run
        expect(Timetable.first.costs).not_to be_nil
      end

      context "with a single-slot timetable" do
        before {
          create :weekday
          create :timeframe
        }

        context "soft constraint violations" do
          context "overfull rooms" do
            let(:violation) { Timetable::OverfullRoom.first }
            before {
              create :room, :capacity => 10
              create :course, :participants => 100
            }

            it "will be noticed" do
              expect { run }.to change {Timetable::OverfullRoom.count}.from(0).to(1)
            end

            it "severity is equal to the number of exceeded seats" do
              run
              expect(violation.severity).to eq 90
            end

            it "problematic timetable entry is associated" do
              run
              expect(violation.entry).to be present
            end

          end
        end
      end

    end

    context "given only hard constraints" do
      before { job.configuration = Asp::Configuration.only_hard_constraints }

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

        it "and two courses but only one room is unsatisfiable" do
          create :room
          create :course
          create :course
          expect { run }.not_to change { [Timetable.count, Timetable::Entry.count] }
        end

        it "and two courses and two rooms yields two possible timetables" do
          create :room
          create :room
          create :course
          create :course
          expect { run }.to change { [Timetable.count, Timetable::Entry.count] }.from([0,0]).to([2,4])
        end

        it "same teacher can't hold two lectures at the same time in different rooms" do
          teacher = create :teacher
          create :room
          create :room
          create :course, :teacher => teacher
          create :course, :teacher => teacher
          expect { run }.not_to change { [Timetable.count, Timetable::Entry.count] } # because it's unsatisfiable
        end


      end
      context "with a two-slot timetable" do
        before {
          create :weekday
          create :timeframe
          create :timeframe
        }
        context "and two rooms" do
          before {
            create :room
            create :room
          }
          context "if two courses belong to the same curriculum" do
            let(:curriculum) { create :curriculum, :name => "It-Systems-Engineering Master" }
            let(:course1) { create :course_with_curriculum, :name => "Softskills", :curriculum  => curriculum }
            let(:course2) { create :course_with_curriculum, :name => "Hardskills", :curriculum  => curriculum }
            before { course1; course2 }

            it "doesn't schedule the two courses in the same timeslot" do
              run
              Timetable.find_each do |t|
                expect(t.entries).to be_scheduled_at_different_times
              end
            end
          end
        end
      end

    end
  end

end
