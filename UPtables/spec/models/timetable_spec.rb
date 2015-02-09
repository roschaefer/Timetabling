require 'rails_helper'

describe Timetable do
  it "empty timetable can be created" do
    create(:timetable)
  end
end
