class PurchaseRecord < ApplicationRecord
  belongs_to :user, :item, :shipping_destination
end
