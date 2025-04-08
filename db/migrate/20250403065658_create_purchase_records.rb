class CreatePurchaseRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_records do |t|
      t.integer :purchaser,  null: false
      t.integer :name,       null: false
      t.timestamps
    end
  end
end
