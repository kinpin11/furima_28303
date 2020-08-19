class UserBuyer
  include ActiveModel::Model

  attr_accessor :post_code, :shipping_origin_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_origin_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
  def save
    Buyer.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(post_code: post_code, shipping_origin_id: shipping_origin_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end
