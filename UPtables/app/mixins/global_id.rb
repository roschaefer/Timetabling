module GlobalId

  def g_id
    "#{self.class.model_name.param_key}_#{self.id}"
  end

end

