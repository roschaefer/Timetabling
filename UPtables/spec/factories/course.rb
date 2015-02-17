FactoryGirl.define do
  factory :course do
      name                 "Informatik für Naturwissenschaften"
      association          :teacher
      dates                2
      minimum_working_days 2
      participants         20
      double_lecture       false
  end
end
