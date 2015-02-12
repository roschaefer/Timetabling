class Asp::Model
  attr_reader :assignments, :cost

  def initialize(hash)
    @assignments = []
    @cost = hash["Costs"]
    hash["Value"].each do |v|
      @assignments.push(parse(v))
    end
  end

  private
  # TODO: remove hard coding
  def parse(assigned_string)
    elements = assigned_string.scan(/assigned\((.*),(.*),(.*),(.*)\)/)
    Hash[[:course, :room, :day, :time].zip(*elements)]
  end
end
