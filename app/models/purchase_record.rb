class PurchaseRecord < ApplicationRecord
  belongs_to :user 
  belongs_to :item 
  belongs_to :shipping_destination
end
