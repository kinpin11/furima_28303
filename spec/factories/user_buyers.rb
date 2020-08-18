FactoryBot.define do
  factory :user_buyer do
    post_code { '123-4567' }
    shipping_origin_id { '1' }
    city { '青山1-1-1' }
    house_number { '柳ビル１' }
    phone_number { Faker::Number.number(digits: 11) }
    token { 'env["PAYJP_PUBLIC_KEY"] = ENV["PAYJP_PUBLIC_KEY"]' }
  end
end
