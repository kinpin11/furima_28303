FactoryBot.define do
  factory :item do
    name { 'マグカップ' }
    text { 'マグカップ' }
    category_id { '1' }
    status_id { '2' }
    payer_id { '1' }
    shipping_origin_id { '2' }
    date_until_shipping_id { '2' }
    price { '1000' }

    association :user
  end
end
