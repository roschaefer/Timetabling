require 'rails_helper'

describe Teacher, type: :model do
  subject(:teacher) { create :teacher }

  describe "#update_unavailabilities" do
    


    it "creates unavailabilities" do
      
      update_array = ["0 0", "1 1", "2 3"]
      
      expect{teacher.update_unavailabilities(update_array)}.to change {Teacher::Unavailability.all.map{|u| [u.weekday_id, u.timeframe_id]}}.from([]).to([[0,0],[1,1],[2,3]])
      
    end
    
    it "deletes unavailabilities" do
      
      update_array = []
      
      3.times {create :teacher_unavailability, :teacher_id => teacher.id}
      
      expect{teacher.update_unavailabilities(update_array)}.to change {Teacher::Unavailability.count}.from(3).to(0)
      
    end
    
    it "deletes only specified unavailabilities" do
      
      update_array = ["2 1", "2 4"]
      create :weekday, :id => 2
      create :timeframe, :id => 1
      create :timeframe, :id =>4
      
      create :teacher_unavailability, :teacher_id => teacher.id, :weekday_id => 2, :timeframe_id => 1
      create :teacher_unavailability, :teacher_id => teacher.id, :weekday_id => 2, :timeframe_id => 4
      
      create :teacher_unavailability, :teacher_id => teacher.id
      create :teacher_unavailability, :teacher_id => teacher.id
            
      expect{teacher.update_unavailabilities(update_array)}.to change {Teacher::Unavailability.count}.from(4).to(2)
      
    end
    
  end
end
