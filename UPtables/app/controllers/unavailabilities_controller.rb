class UnavailabilitiesController < ApplicationController
  
  before_action :set_unavailabilities, only: [:index]
  
  
  def index  
    @weekdays = Weekday.all
    @timeframes = Timeframe.all
    @teacher = Teacher.find(params[:teacher_id])
  end
  
  def set
    
    @weekdays = Weekday.all
    @timeframes = Timeframe.all
    @teacher = Teacher.find(params[:teacher_id])
    
    
    @weekdays.each do |day|
      @timeframes.each do |frame|    
        if params[:date]["#{day.id}"] and params[:date]["#{day.id}"]["#{frame.id}"] then
          Unavailability.where(teacher:@teacher,weekday_id:"#{day.id}",timeframe_id:"#{frame.id}").first_or_create
        else
          erasable = Unavailability.find_by(teacher:@teacher,weekday_id:"#{day.id}",timeframe_id:"#{frame.id}")
          erasable.destroy if erasable
        end
      end
    end
    
    redirect_to teacher_unavailabilities_path
  end

  private
    def set_unavailabilities
      @unavailabilities = Unavailability.where(teacher_id:params[:teacher_id])
    end
end
