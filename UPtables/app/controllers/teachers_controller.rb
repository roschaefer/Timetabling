class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  def index
    @teachers = Teacher.all
  end
  
  
  def edit
    @weekdays = Weekday.all
    @timeframes = Timeframe.all
    
    @unavailabilities = Teacher::Unavailability.where(teacher:@teacher)
  end
  
  def update
    
    @weekdays = Weekday.all
    @timeframes = Timeframe.all
        
    respond_to do |format|
      #@teacher.update(teacher_params)
      if  @teacher.update_unavailabilities(params[:teacher_unavailability_ids])
        format.html { redirect_to edit_teacher_path, notice: 'Teacher was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def teacher_params
      params.require(:teacher).permit(:first_name, :surname)
    end
    
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
end
