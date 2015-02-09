require 'rails_helper'

describe Timetable do
  it "empty timetable can be created" do
    FactoryGirl.create(:timetable)
  end
end
