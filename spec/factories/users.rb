FactoryBot.define do

  factory :user, class: User do
    name              {"斎藤"}
    email                 {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    last_name          {"田中"}
    last_name_kana     {"タナカ"}
    birthyear              {"2017"}
    birthmonth              {"12"}
    birthday              {"12"}
    mobile_number          {"0000000000"}
  end

end