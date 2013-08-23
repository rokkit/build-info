# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country do
    name "Aztorka"
  end
  factory :region do
    name "Noman"
    country {  Country.find_by_name("Aztorka") }
  end
  factory :city do
    name "Braben"
    region { Region.find_by_name "Noman" }
  end
  factory :distinct do
    name "District 21"
    city  { City.find_by_name "Braben" }
  end
  factory :street do
    name "Veteranov"
    distinct { Distinct.find_by_name "District 21" }
  end
  factory :address do
    country { Country.find_by_name("Aztorka") || FactoryGirl.create(:country) }
    region  { Region.find_by_name("Noman") || FactoryGirl.create(:region) }
    city { City.find_by_name("Braben") || FactoryGirl.create(:city) }
    distinct { Distinct.find_by_name("District 21") || FactoryGirl.create(:distinct) }
    street { Street.find_by_name("Veteranov") || FactoryGirl.create(:street) }
  end
end
