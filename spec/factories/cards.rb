FactoryBot.define do
  factory :card do
    customer_id { 1 }
    card_id { 1 }
    user
  end
end
