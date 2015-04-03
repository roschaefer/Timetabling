module GlobalId
    
  def g_id
    "#{self.class.name.underscore.tr("/","_")}_#{self.read_attribute(:id)}"
  end
  
end

