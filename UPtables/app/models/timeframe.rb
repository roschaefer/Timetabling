class Timeframe < ActiveRecord::Base
  include Asp::Element
  include GlobalId

  def asp_representation
    "timeframe(#{g_id}, #{id})."
  end
end
