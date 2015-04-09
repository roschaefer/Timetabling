class TimetablePresenter
  FIXNUM_MAX = (2**(0.size * 8 -2) -1)
  include Comparable

  def initialize(timetable)
    @timetable = timetable
  end

  def <=>(anOther)
    if (comparable_array.size != anOther.comparable_array)
      comparable_array <=> anOther.comparable_array
    else
      # Timetables have different number of entries
      nil # raises ArgumentError
    end
  end

  def ast_table
    @ast_table ||= create_ast_table
  end

  def comparable_array
    @comparable_array ||= create_comparable_array
  end

  def text_array
    comparable_array.map{|x| ((x == FIXNUM_MAX && "" ) || x.to_s) }
  end

  private

  def create_ast_table
    table = []
    table.push(* create_header_rows)
    weekdays.each do |wd|
      timeframes.each do |tf|
        table << create_row(wd, tf)
      end
    end
    Cucumber::Ast::Table.new(table)
  end

  def create_comparable_array
    result = []
    weekdays.each do |wd|
      timeframes.each do |tf|
        rooms.each do |r|
          cell_entry = entries.find { |e| (e.weekday == wd) && (e.timeframe == tf) && (e.room == r) }
          result << ((cell_entry && cell_entry.course_component.id) || FIXNUM_MAX) # let's hope there is no id of that size
        end
      end
    end
    result
  end

  def create_header_rows
    first_row = ["",""]
    second_row = ["",""]
    rooms.each do |room|
      first_row << room.name
      second_row << room.capacity.to_s
    end
    [first_row, second_row]
  end

  def create_row(wd,tf)
    row = []
    rooms.each do |room|
      row << wd.name
      row << tf.interval
      cell_entry = entries.find { |e| (e.weekday == wd) && (e.timeframe == tf) && (e.room == room) }
      if cell_entry
        row << cell_entry.course_component.name
      else
        row << ""
      end
    end
    row
  end

  def rooms
    Room.all
  end

  def timeframes
    Timeframe.all
  end

  def weekdays
    Weekday.all
  end

  def entries
    @timetable.entries
  end
end
