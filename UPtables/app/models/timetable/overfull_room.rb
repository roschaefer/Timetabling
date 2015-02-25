class Timetable::OverfullRoom < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :entry

  def self.asp_regex
    #assigned(24,7,2,6)
    /penalty\(\"RoomCapacity\",.*,(.*)\)/
  end

  def self.from_asp(elements)
    new(Hash[[:severity].zip(*elements)])
  end
end
