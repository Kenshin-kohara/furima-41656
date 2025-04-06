class CreatePurchaseRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_records do |t|
      t.references :purchaser  null: false, foreign_key: true
      t.references :name       null: false, foreign_key: true
      t.timestamps
    end
  end
end
