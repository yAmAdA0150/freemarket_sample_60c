FactoryBot.define do
  
  factory :address do
    postcode {"123-4567"}
    city {Faker::Address.city}
    street {Faker::Address.street_address}
    building_name {Faker::Dessert.variety}
    phone_number {1234567890}
    prefecture
    user
  end
end