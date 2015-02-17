class Asp::Constraint

  HARD_CONSTRAINTS = ["scheduled", "conflicts", "room_occupancy", "availability", "double_lectures", "additional", "room_availability"]
  SOFT_CONSTRAINTS = ["room_capacity", "minimum_working_days", "isolated_lectures"]

  class << self
    protected :new

    HARD_CONSTRAINTS.each do |location|
      define_method(location) do
       new("hard/#{location}")
      end
    end

    SOFT_CONSTRAINTS.each do |location|
      define_method(location) do
       new("soft/#{location}")
      end
    end

  end

def initialize(location)
  @location = File.join("lib", "asp", "constraints", "#{location}.lp")
end

def to_asp
  IO.read(@location)
end
end
