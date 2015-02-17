class Timeframe < ActiveRecord::Base
  def self.to_fact
    "periods_per_day(#{count})."
  end
end
