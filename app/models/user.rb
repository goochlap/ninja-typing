class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :avatar
  validates :email, presence: true
  validates :name, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
