FactoryBot.define do
  factory :prefecture do
    id {rand(47)}
    name {Faker::Address.city}
  end
