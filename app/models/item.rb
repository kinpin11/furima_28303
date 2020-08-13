class Item < ApplicationRecord
  validates :image, :name, :text, :category_id, :status_id, :payer_id, :shipping_origin_id, :date_until_shipping_id, presence: true
  belongs_to :user
  has_one_attached :image
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
end
