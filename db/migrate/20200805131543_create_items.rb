class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image,            null:false
      t.string :name,           null:false
      t.string :text,           null:false
      t.integer :category_id,   presence: true
      t.integer :status_id,     presence: true
      t.integer :payer_id,      presence: true
      t.integer :shipping_origin_id,      presence: true
      t.integer :date_until_shipping_id,   presence: true
      t.integer :price,        null:false
      t.references :user,      null:false,foreign_key:true
      t.timestamps
    end
  end
end
