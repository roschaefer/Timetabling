class Teacher < ActiveRecord::Base
  has_many :unavailabilities, dependent: :destroy

  def full_name
    "#{first_name} #{surname}"
  end
  
  def available_at!(weekday_id, timeframe_id)
    Teacher::Unavailability.where(:teacher => self, :weekday_id => weekday_id, :timeframe_id => timeframe_id).destroy_all
  end

  def unavailable_at!(weekday_id, timeframe_id)
    Teacher::Unavailability.where(:teacher => self, :weekday_id => weekday_id, :timeframe_id => timeframe_id).first_or_create
  end
  
  def update_unavailabilities(params)
    
    if params
      new_unavailibilities = params.map{|day_frame| day_frame.split(' ')}.to_set
      old_unavailibilities = unavailabilities.map{|u| [u.weekday_id.to_s, u.timeframe_id.to_s]}.to_set
          
      to_add = new_unavailibilities - old_unavailibilities
      to_del = old_unavailibilities - new_unavailibilities
      
      to_add.each do |u|
        unavailable_at! u.first, u.second
      end
      
      to_del.each do |u|
        available_at! u.first, u.second
      end
    end
      
    true
  end
  
end
