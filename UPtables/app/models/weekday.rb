class Weekday < ActiveRecord::Base
  def to_fact
    "d(#{id})."
  end
end
