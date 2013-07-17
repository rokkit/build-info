# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
    min_price 0
    max_price 999999999
    min_area 0
    max_area 99999999
  end
end
