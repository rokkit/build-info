# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
    min_price 1000
    max_price 6000
    min_area 20
    max_area 100
    addresses { |g| [ g.association(:address) ]}
  end
end
