class Timetable::OverfullRoom < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :entry
  validates :entry_id, :presence => true

  def self.asp_regex
    #assigned(24,7,2,6)
    /^penalty\(\"RoomCapacity\",assigned\((.*),(.*),(.*),(.*)\),(.*)\)$/
  end

  def self.from_asp(elements, context)
    option_hash = Hash[[*Timetable::Entry.asp_attributes, :severity].zip(*elements)]

    entries   = context.find_all{|e| e.is_a?(Timetable::Entry)}
    associated_entry = entries.find {|e|
      (e.course_id    == option_hash[:course_id].to_i) &&
      (e.room_id      == option_hash[:room_id].to_i) &&
      (e.weekday_id   == option_hash[:weekday_id].to_i) &&
      (e.timeframe_id == option_hash[:timeframe_id].to_i)
    }
    new(option_hash.slice(:severity).merge(:entry => associated_entry))
  end
end
