class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:date_of_birth, presence: true
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/, message: 'must be in Kanji, Hiragana, or Katakana' }
  validates :last_name_read, :first_name_read, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be in Katakana' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must include both letters and numbers' }
  validates :password, length: { minimum: 6, message: 'must be at least 6 characters long' }

end
