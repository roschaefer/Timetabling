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

end
