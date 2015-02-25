class Asp::Model
  attr_reader :assignments, :costs

  def initialize(model_hash)
    @model_hash = model_hash
    @assignments = []
    @costs = model_hash["Costs"][0] if model_hash["Costs"]
  end

  def extract(aclass)
    results = []
    unless (@model_hash["Value"])
      return results
    end
    @model_hash["Value"].each do |v|
      elements = v.scan(aclass.asp_regex)
      unless elements.empty?
        results << aclass.from_asp(elements, @assignments)
        @assignments.push( * results)
      end
    end
    results
  end

end
