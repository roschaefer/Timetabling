class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :set_timeframes_weekdays, only: [:new, :edit]
  
  def index
    @teachers = Teacher.all
  end
  
  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    
    if @teacher.save and @teacher.update_unavailabilities(params[:teacher_unavailability_ids])
      redirect_to teachers_path, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update      
    if @teacher.update(teacher_params) and @teacher.update_unavailabilities(params[:teacher_unavailability_ids])
      redirect_to edit_teacher_path, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end

  private
    def teacher_params
      params.require(:teacher).permit(:first_name, :surname)
    end
    
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
    
    def set_timeframes_weekdays
      @weekdays = Weekday.all
      @timeframes = Timeframe.all
    end
end
