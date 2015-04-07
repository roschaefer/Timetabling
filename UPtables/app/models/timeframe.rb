class Timeframe < ActiveRecord::Base
  include GlobalId

  def to_fact
    "timeframe(#{g_id}, #{id})."
  end
end
