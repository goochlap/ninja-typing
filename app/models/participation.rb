class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :board

  before_create do
    self.finished_in = '0' if finished_in.blank?
  end
end
