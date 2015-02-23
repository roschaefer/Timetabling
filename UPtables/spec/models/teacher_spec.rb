require 'rails_helper'

describe Teacher, type: :model do
  subject(:teacher) { create :teacher }

  describe "#update_unavailabilities" do
    
    context "update array nil" do
      it "raises no error" do
        update_array = nil
        3.times {create :teacher_unavailability, :teacher_id => teacher.id}
        expect {teacher.update_unavailabilities(update_array)}.to_not raise_error
      end
      
      it "has no effect on availibilities" do
        update_array = nil
        3.times {create :teacher_unavailability, :teacher_id => teacher.id}
        expect {teacher.update_unavailabilities(update_array)}.to_not change {Teacher::Unavailability.count}
      end
    end
    
    context "valid update array" do
      it "creates unavailabilities" do
        3.times do |i|
          create :weekday, :id => i
          create :timeframe, :id => i
        end
        update_array = ["0 0", "1 1", "2 2"]
        
        expect{teacher.update_unavailabilities(update_array)}.to change {Teacher::Unavailability.all.map{|u| [u.weekday_id, u.timeframe_id]}}.from([]).to([[0,0],[1,1],[2,2]])
        
      end
      
      it "deletes unavailabilities" do
        update_array = []
        3.times {create :teacher_unavailability, :teacher_id => teacher.id}
        expect{teacher.update_unavailabilities(update_array)}.to change {Teacher::Unavailability.count}.from(3).to(0)
        
      end
      
      it "deletes only specified unavailabilities" do
        
        update_array = ["2 1", "2 4"]
        
        w2 = create :weekday, :id => 2
        w5 = create :weekday, :id => 5
        w6 = create :weekday, :id => 6
        
        t1 = create :timeframe, :id => 1
        t4 = create :timeframe, :id => 4
        
        create :teacher_unavailability, :teacher_id => teacher.id, :weekday => w2, :timeframe => t1
        create :teacher_unavailability, :teacher_id => teacher.id, :weekday => w2, :timeframe => t4
        
        create :teacher_unavailability, :teacher_id => teacher.id, :weekday => w5, :timeframe => t1
        create :teacher_unavailability, :teacher_id => teacher.id, :weekday => w6, :timeframe => t4
              
        expect{teacher.update_unavailabilities(update_array)}.to change {Teacher::Unavailability.count}.from(4).to(2)
      end
    end
    
  end
end
