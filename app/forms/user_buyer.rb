class UserBuyer

  include ActiveModel::Model

  attr_accessor :post_code, :shipping_origin_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id

  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :shipping_origin_id, numericality: { other_than: 0}  
  validates :city,   presence: true
  validates :house_number,  presence: true
  validates :phone_number,   format: {with: /\A[a-zA-Z0-9]+\z/}

  def save
    Buyer.create(user_id: user_id, item_id: item_id)
   
    ShippingAddress.create(post_code: post_code, shipping_origin_id: shipping_origin_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  
  end

end
  