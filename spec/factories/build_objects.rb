# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :build_object do
    address
    price 3000
    area 40
    type_of_build_object TypeOfBuildObject.create
    photos { |g| [ g.association(:photo) ]}
  end

  factory :photo do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'seeds', 'test_image.jpg')) }
  end
end
