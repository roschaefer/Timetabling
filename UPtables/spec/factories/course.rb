FactoryGirl.define do
  factory :course do
      name                 "Informatik für Naturwissenschaften"
      association          :teacher
      dates                1
      minimum_working_days 1
      participants         20
      double_lecture       false
  end
end
