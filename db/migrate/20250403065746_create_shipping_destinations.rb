class CreateShippingDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_destinations do |t|
      t.string     :post_code,     null: false, default: ""
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false, default: ""
      t.string     :street,        null: false, default: ""
      t.string     :building,      null: false, default: ""
      t.integer    :phone_number,  null: false
      t.references :purchaser,     null: false, foreign_key: { to_table: :purchase_records }
      t.timestamps
    end
  end
end
