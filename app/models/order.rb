class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :purchase_record_id, :token, :price

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :street
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: "is not a valid phone number format" }
    validates :user_id, :token##ログインしている購入者(ユーザー)を参照
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save 
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingDestination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

end