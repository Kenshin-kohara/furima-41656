class ShippingRecord
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :street, :building, :phone_number, :purchaser, :name

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :street
    validates :phone_number
    validates :purchaser, :name
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
  purchase_record = Purchase_record.create(purchaser: user_id, name: name)
  Shipping_destination.create(post_code: post_code, prefecture: prefecture_id, city: city, street: street,
  building: building, phone_number: phone_number, purchaser: user_id)
  end

end