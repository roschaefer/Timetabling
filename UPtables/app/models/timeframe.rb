class Timeframe < ActiveRecord::Base
  def to_fact
    "ppd(#{id})."
  end
end
