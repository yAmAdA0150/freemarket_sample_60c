FactoryBot.define do
  factory :address, class: Address do
    postcode {"123-4567"}
    city {Faker::Address.city}
    street {Faker::Address.street_address}
    building_name {Faker::Dessert.variety}

    trait :prefecture_id do
      prefecture_id
    end
    association :prefecture, factory: :prefecture
    association :user, factory: :user

  end
end