class TimetablesController < ApplicationController
  def index
    @timetables = Timetable.all
  end

  def show
    @timetable = Timetable.find(params[:id])
    @rooms = Room.all
    @weekdays = Weekday.all
    @timeframes  = Timeframe.all
  end

  def solve
    Timetable.destroy_all
    job = Asp::Job.new
    job.run
    redirect_to action: 'index'
  end
end
