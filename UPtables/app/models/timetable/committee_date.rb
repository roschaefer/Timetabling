class Timetable::CommitteeDate < ActiveRecord::Base
  belongs_to :weekday
  belongs_to :timeframe
  belongs_to :timetable

  def self.asp_regex
    /^committee_date\(\D*(\d+),\D*(\d+)\)$/
  end

  def self.from_asp(elements, context)
    option_hash = Hash[[:weekday_id, :timeframe_id].zip(*elements)]
    new(option_hash)
  end
end
