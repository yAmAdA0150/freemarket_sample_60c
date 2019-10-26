FactoryBot.define do
  factory :condition, class: Condition do
    name {Faker::Team.name}
  end
end
