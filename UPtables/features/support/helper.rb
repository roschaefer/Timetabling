module Helper
  class TimetablePresenter
    include Comparable

    def initialize(timetable)
      @timetable = timetable
    end

    def <=>(anOther)
      if (binary_string.size != anOther.binary_string)
        anOther.binary_string <=> binary_string
      else
        raise "Timetables have different number of entries"
      end
    end

    def ast_table
      @ast_table ||= create_ast_table
    end

    def binary_string
      @binary_string ||= create_binary_string
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

    def create_binary_string
      result = ""
      weekdays.each do |wd|
        timeframes.each do |tf|
          rooms.each do |r|
            cell_entry = entries.find { |e| (e.weekday == wd) && (e.timeframe == tf) && (e.room == r) }
            result << ((cell_entry.nil? && "0") || "1")
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
end
