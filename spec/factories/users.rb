FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1' + 'a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '太郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birth { Faker::Date.in_date_period(year: 2000) }
  end
end
