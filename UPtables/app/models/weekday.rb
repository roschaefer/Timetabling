class Weekday < ActiveRecord::Base
  include GlobalId
  include Asp::Element
  asp_schema :global_id, :id

  def asp_representation
    "weekday(#{g_id}, #{id})."
  end
end
