class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :board
end
