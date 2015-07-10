class Timetable::OverfullRoom < ActiveRecord::Base
  include Asp::Element

  belongs_to :entry

  def self.asp_regex
    /^penalty\(\"RoomCapacity\",(?<#{Timetable::Entry.to_s}>#{Timetable::Entry.asp_regex.to_s}),(?<severity>.*)\)$/
  end

  def self.asp_attributes
    [Timetable::Entry, :severity]
  end

  def asp_initialize(opts={})
    self.severity = opts[:severity]
    @referenced_entry_attributes = opts[Timetable::Entry].stringify_keys
  end

  def assign_reference(element)
    if element.is_a?(Timetable::Entry)
      if (@referenced_entry_attributes.all? {|key, value| element.attributes[key].to_s == value })
        self.entry = element
      end
    end
  end

  def self.from_asp(elements, context)
    option_hash = Hash[[*Timetable::Entry.asp_attributes, :severity].zip(*elements)]

    entries   = context.find_all{|e| e.is_a?(Timetable::Entry)}
    associated_entry = entries.find {|e|
      (e.course_component_id    == option_hash[:course_component_id].to_i) &&
      (e.room_id      == option_hash[:room_id].to_i) &&
      (e.weekday_id   == option_hash[:weekday_id].to_i) &&
      (e.timeframe_id == option_hash[:timeframe_id].to_i)
    }
    new(option_hash.slice(:severity).merge(:entry => associated_entry))
  end
end
