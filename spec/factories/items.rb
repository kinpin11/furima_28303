FactoryBot.define do
  factory :item do
    image { Faker::Lorem.sentence }
    name { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    category_id { '1' }
    status_id { '2' }
    payer_id { '1' }
    shipping_origin_id { '2' }
    date_until_shipping_id { '2' }
    price { Faker::Number.within(range: 300..9_999_999) }

    association :user
  end
end
