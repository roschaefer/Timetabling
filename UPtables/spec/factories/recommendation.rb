FactoryGirl.define do
  factory :recommendation do
    semester 1
    association :course
    association :curriculum
  end
end
