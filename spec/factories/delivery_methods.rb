FactoryBot.define do
  factory :delivery_method, class: DeliveryMethod do
    name {Faker::Team.name}
  end
end