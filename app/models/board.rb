class Board < ApplicationRecord
  belongs_to :avatar

  has_many :participations, dependent: :destroy
  has_many :games, through: :participations
end
