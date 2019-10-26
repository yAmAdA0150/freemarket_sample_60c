FactoryBot.define do
  factory :category, class: Category do
    genre {Faker::Team.name}
  end
end
