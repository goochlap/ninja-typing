class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :board

  before_create do
    self.finished_in = '0 min 0 sec' if finished_in.blank?
  end
end
