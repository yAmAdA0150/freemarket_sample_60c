FactoryBot.define do
  factory :sns_credential, class: SnsCredential do
    uid {Faker::Team.name}
    provider {Faker::Team.name}
    user
  end
end
