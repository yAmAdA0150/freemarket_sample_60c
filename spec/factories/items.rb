FactoryBot.define do
  
  factory :item do
    name { Faker::Games::Pokemon.name } 
    price {rand(10000)}
    text {Faker::Games::Pokemon.move}
    display_id {1}
    condition_id {1}
    category
    brand
    size
    user
    images {[
      FactoryBot.build(:image, item: nil)
    ]}
  end
end
