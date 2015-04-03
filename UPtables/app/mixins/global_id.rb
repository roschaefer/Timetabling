module GlobalId
    
  def g_id
    "#{self.class.table_name}_#{self.read_attribute(:id)}"
  end
  
end

