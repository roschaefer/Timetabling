class Asp::Model
  attr_reader :assignments, :costs

  def initialize(model_hash)
    @model_hash = model_hash
    @assignments = []
    @costs = model_hash["Costs"]
  end

  def extract(aclass)
    results = []
    unless (@model_hash["Value"] && aclass.respond_to?(:asp_attributes) && aclass.respond_to?(:asp_attributes))
      return results
    end
    part = aclass.asp_attributes.collect{|a| "(.*)" }.join(",")
    regex = /#{aclass.asp_label}\(#{part}\)/
    @model_hash["Value"].each do |v|
      elements = v.scan(regex)
      option_hash = Hash[aclass.asp_attributes.zip(*elements)]
      results << aclass.new(option_hash)
    end
    results
  end

end
