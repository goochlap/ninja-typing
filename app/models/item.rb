class Item < ApplicationRecord
  has_many :avatar_items
  belongs_to :category
end
