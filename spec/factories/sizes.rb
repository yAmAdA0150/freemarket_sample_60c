FactoryBot.define do
  factory :size, class: Size do
    name {Faker::Team.name}
  end
end
