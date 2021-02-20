class Avatar < ApplicationRecord
  belongs_to :user

  has_many :items, through: :avatar_items
  has_many :avatar_items
end
