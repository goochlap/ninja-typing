class Avatar < ApplicationRecord
  belongs_to :user

  has_one :board, dependent: :destroy
  has_many :items, through: :avatar_items
  has_many :avatar_items

  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
end
