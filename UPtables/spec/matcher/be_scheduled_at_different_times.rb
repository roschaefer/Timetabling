require 'rspec/expectations'

RSpec::Matchers.define :be_scheduled_at_different_times do
  match do |timetable_entries|
    scheduled_at_different_times?(timetable_entries)
  end

  def scheduled_at_different_times?(timetable_entries)
    # assuming (timetable_entries.is_a? Enumerable && timetable_entries.all? {|e| e.is_a? Timetable::Entry })
    id_pairs = timetable_entries.collect {|e| [e.weekday_id, e.timeframe_id] }
    @duplicates = id_pairs.group_by {|e| e}.select {|k,v| v.size >1}.map(&:first)
    not @duplicates.present?
  end

  failure_message do |timetable_entries|
    "expected no duplicate times but found #{@duplicates}"
  end
end
