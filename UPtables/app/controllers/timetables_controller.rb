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
    job = Asp::Job.new
    job.time_out = params[:time_out]
    job.run
    redirect_to action: 'index'
  end
end
