class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :keep
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :bearer

  validates :image, :name, :explanation, presence: true
  validates :category_id, :keep_id, :bearer_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

end
