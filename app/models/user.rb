class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :avatar
  validates :email, presence: true
  validates :name, uniqueness: true, presence: true
  validates :password, format: { with: /\A(?=.*\d)(?=.*([a-z]))(?=.*[@#$%^&+=]){6,}\z/i, message: "must be at least 6 characters and include one special character."}
end
