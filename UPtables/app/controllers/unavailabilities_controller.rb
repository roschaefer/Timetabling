class UnavailabilitiesController < ApplicationController
  
  before_action :set_unavailabilities, only: [:index]
  
  
  def index  
    @weekdays = Weekday.all
    @timeframes = Timeframe.all
  end
  
  def set
    redirect_to teacher_unavailabilities_path
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  private
    def set_unavailabilities
      @unavailabilities = Unavailability.where(teacher_id:params[:teacher_id])
    end
end
