class Weekday < ActiveRecord::Base
  include GlobalId

  def to_fact
    "weekday(#{g_id}, #{id})."
  end
end
