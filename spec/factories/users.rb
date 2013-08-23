# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
    fio Faker::Name.name
    phone '+79523707281'
    confirmed_at Time.zone.now
  end
end
