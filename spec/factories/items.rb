FactoryBot.define do
  factory :item, class: Item do
    name { Faker::Games::Pokemon.name } 
    price {rand(10000)}
    text {Faker::Games::Pokemon.move}
    brand_id {"1"}
    prefecture_id {"1"}
    shipping_id {"1"}
    size_id	{"1"}
    display {"1"}
    condition_id {"1"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    association :category, factory: :category
    association :user, factory: :user
    association :prefecture, factory: :prefecture
  end
end
