class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :image, :name, :explanation, :price, presence: true
  validates :category_id, :keep_id, :bearer_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }
end
