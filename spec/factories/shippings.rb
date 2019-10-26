FactoryBot.define do
  factory :shipping do
    charge {1}
    prefecture_id {1}
    item
    term_id {1}
    delivery_method_id {1}
  end
end
