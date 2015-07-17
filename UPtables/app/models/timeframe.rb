class Timeframe < ActiveRecord::Base
  include Asp::Element
  include GlobalId
  asp_schema :global_id, :id

  def asp_representation
    "timeframe(#{g_id}, #{id})."
  end
end
