class Timetable::OverfullRoom < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :entry
  validates :entry_id, :presence => true

  def self.asp_regex
    #assigned(24,7,2,6)
    /penalty\(\"RoomCapacity\",assigned\((.*),(.*),(.*),(.*)\),(.*)\)/
  end

  def self.from_asp(elements)
    option_hash = Hash[[*Timetable::Entry.asp_attributes, :severity].zip(*elements)]
    associated_entry = Timetable::Entry.find_by(option_hash.slice(Timetable::Entry.asp_attributes))
    new(option_hash.slice(:severity).merge(:entry => associated_entry))
  end
end
