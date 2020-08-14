class Item < ApplicationRecord
  validates :image, :name, :text, :category_id, :status_id, :payer_id, :shipping_origin_id, :date_until_shipping_id, presence: true
  
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :payer
  belongs_to_active_hash :date_until_shipping
  belongs_to_active_hash :shipping_origin
  
  belongs_to :user
  has_one_attached :image
  has_one_attached :buyer
  

end
