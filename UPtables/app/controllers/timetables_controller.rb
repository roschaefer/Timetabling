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
end
