require 'rails_helper'

RSpec.describe Timetable::CommitteeDate, type: :model do
  describe "::asp_regex" do
    it "matches" do
      expect("committee_date(weekday_12, timeframe_34)".scan(Timetable::CommitteeDate.asp_regex)).to eq [["12", "34"]]
    end
  end
end
