class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string     :name,            null: false, default: ""
      t.text       :explanation,     null: false
      t.integer    :price,           null: false, default: "0"
      t.references :user,            null: false, foreign_key: true
      t.integer    :category_id,     null: false
      t.integer    :keep_id,         null: false
      t.integer    :bearer_id,       null: false
      t.integer    :prefecture_id,   null: false
      t.integer    :shipping_day_id, null: false
      t.timestamps
    end
  end
end
