class Asp::Constraint
  attr_accessor :active
  attr_reader :key
  alias_method :active?, :active

  HARD_CONSTRAINTS = [
    "scheduled",
    "conflicts",
    "room_occupancy",
    "availability",
    "additional",
    "room_availability",
    "mandatory_and_recommended_in_same_semester",
    "room_unsuitable",
    "time_windows",
    "committee_dates"
]

  SOFT_CONSTRAINTS = [
    "room_capacity",
    "double_lectures",
    "same_curriculum",
    "recommended_semester",
    "curriculum_unavailabilities",
    "balanced_timetable"
  ]

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
  @location = Rails.root.join("lib", "asp", "constraints", "#{location}.lp")
  @active = true
  @key = location
end

def to_asp
  IO.read(@location)
end

end
