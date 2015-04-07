FactoryGirl.define do
  factory :time_window do
      association       :weekday
      association       :timeframe
      association       :curriculum
      semester          1
  end
end
  
