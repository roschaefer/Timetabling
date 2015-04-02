require 'rails_helper'
describe Asp::Job do
  subject(:job) { Asp::Job.new }

  describe "#run" do
    subject(:run) { job.run }

    context "with soft and hard constraints" do
      #before { job.configuration = Asp::Configuration.default }
      it "creates timetables with costs" do
        
        #@requires_optimization_report (requires clasp optimization report)
        
        create :weekday
        create :timeframe
        create :room
        create :course_component
        run
        expect(Timetable.first.costs).not_to be_nil
      end

      context "with a single-slot timetable" do
        before {
          create :weekday
          create :timeframe
        }

        it "finds optimal solutions" do
          
          #@requires_optimization_report (requires clasp optimization report)
          
          create :room
          create :course_component
          run
          expect(Timetable.all.find_all {|t| t.optimum?}).to have_at_least(1).item
        end

        context "soft constraint violations" do
          context "overfull rooms" do
            let(:violation) { Timetable::OverfullRoom.first }
            before {
              create :room, :capacity => 10
              create :course_component, :participants => 100
            }

            it "only one timetable entry per timetable will be created, the word \"assigned\" is not accidently evaluated to a new Timetable::Entry" do
              run
              Timetable.find_each do |t|
                expect(t.entries).to have(1).item
              end
            end

            it "will be noticed" do
              run
              Timetable::Entry.find_each do |e|
                expect(e.overfull_room).to be_present
              end
            end

            it "severity is equal to the number of exceeded seats" do
              run
              expect(violation.severity).to eq 90
            end

            it "problematic timetable entry is associated" do
              run
              expect(violation.entry).not_to be nil
            end

            it "associated timetable entry is in fact the problematic one" do
              3.times { create :timetable_entry }
              run
              expect(violation.entry.course_component.participants).to be > violation.entry.room.capacity
            end
          end
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

    context "given only hard constraints" do
      before { job.optimize = false }

      context "with a single-slot timetable" do
        before {
          create :weekday
          create :timeframe
        }

        it "and one course and one room yields one timetable with exactly one entry" do
          create :room
          create :course_component
          expect { run }.to change { [Timetable.count, Timetable::Entry.count] }.from([0,0]).to([1,1])
        end

        it "and two courses but only one room is unsatisfiable" do
          create :room
          create :course_component
          create :course_component
          expect { run }.not_to change { [Timetable.count, Timetable::Entry.count] }
        end

        it "and two courses and two rooms yields two possible timetables" do
          create :room
          create :room
          create :course_component
          create :course_component
          expect { run }.to change { [Timetable.count, Timetable::Entry.count] }.from([0,0]).to([2,4])
        end

        it "same teacher can't hold two lectures at the same time in different rooms" do
          teacher = create :teacher
          create :room
          create :room
          create :course_component, :teacher => teacher
          create :course_component, :teacher => teacher
          expect { run }.not_to change { [Timetable.count, Timetable::Entry.count] } # because it's unsatisfiable
        end
      end
    end
  end
end
