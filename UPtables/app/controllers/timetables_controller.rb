class TimetablesController < ApplicationController
  def index
    @timetables = Timetable.all
  end

  def show
    @timetable = Timetable.find(params[:id])
    @entries = @timetable.timetable_entries.order(:day, :time)
    @rooms = Room.all
    @timeslots= @entries.collect{|e| {:day => e.day, :time => e.time} }
    @rooms.uniq!
    @timeslots.uniq!
  end
end
