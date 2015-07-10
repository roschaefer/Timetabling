class Timetable::CommitteeDate < ActiveRecord::Base
  include Asp::Element
  asp_schema :weekday_id, :timeframe_id

  belongs_to :weekday
  belongs_to :timeframe
  belongs_to :timetable

  def self.asp_regex
    /committee_date\(\D*(?<weekday_id>\d+),\D*(?<timeframe_id>\d+)\)/
  end

  def asp_initialize(opts={})
    self.attributes = opts
  end
end
