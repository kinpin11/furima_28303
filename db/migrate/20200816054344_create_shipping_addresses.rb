class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.integer :post_code,             presence: true
      t.integer :shipping_origin_id,     presence: true
      t.string :city,     presence: true
      t.string :house_number,      presence: true
      t.string :building_name,   presence: true
      t.string :phone_number,    presence: true
      t.references :item,         presence: true, foreingn_key:true
      t.timestamps
    end
  end
end
