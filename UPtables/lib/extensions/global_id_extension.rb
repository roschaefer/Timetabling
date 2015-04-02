module GlobalId
  extend ActiveSupport::Concern
  
  def g_id
    "#{self.class.table_name}_#{self.read_attribute(:id)}"
  end
end

class ActiveRecord::Base
  include GlobalId
end