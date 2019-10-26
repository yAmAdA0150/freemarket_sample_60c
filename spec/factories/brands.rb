FactoryBot.define do
  factory :brand, class: Brand do
    name {Faker::Team.name}
  end
end
