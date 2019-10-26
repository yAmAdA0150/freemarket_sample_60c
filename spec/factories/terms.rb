FactoryBot.define do
  factory :term, class: Term do
    name {Faker::Team.name}
  end
end