class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, :last_name, :first_name,
            :last_name_read, :first_name_read, :date_of_birth, presence: true
end
