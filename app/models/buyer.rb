class Buyer < ApplicationRecord
  validates :user, :item          pricepresence: true
  belongs_to :user
end
