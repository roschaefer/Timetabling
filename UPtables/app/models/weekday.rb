class Weekday < ActiveRecord::Base
  def self.to_fact
    "days(#{count})."
  end
end
