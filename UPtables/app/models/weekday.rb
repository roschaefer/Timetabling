class Weekday < ActiveRecord::Base
  include GlobalId
  include Asp::Element

  def asp_representation
    "weekday(#{g_id}, #{id})."
  end
end
