# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country do
    name Faker::Address.city
  end
  factory :region do
    name Faker::Address.state
    country
  end
  factory :city do
    name Faker::Address.city
    region
  end
  factory :distinct do
    name Faker::Address.street_suffix
    city
  end
  factory :street do
    name Faker::Address.street_name
    distinct
  end
  factory :address do
    country
    region
    city
    distinct
    street
  end
end
