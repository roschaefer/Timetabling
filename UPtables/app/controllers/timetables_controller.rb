class TimetablesController < ApplicationController
  def index
    @timetables = Timetable.all
    @timed_out = (@timetables.present? && @timetables.none? {|t| t.optimum? })
  end

  def show
    @timetable = Timetable.find(params[:id])
    @rooms = Room.all
    @weekdays = Weekday.all
    @timeframes  = Timeframe.all
  end

  def solve
    job = Timetabling::Job.new
    job.time_out = params[:time_out]
    job.optimize = true
    job.run
    redirect_to action: 'index'
  end
end
