class Board < ApplicationRecord
  belongs_to :avatar

  has_many :participations
  has_many :games, through: :participations
end
