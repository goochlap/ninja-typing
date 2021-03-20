class Avatar < ApplicationRecord
  before_create :default_values
  belongs_to :user

  has_one :board, dependent: :destroy
  has_many :avatar_items, dependent: :destroy
  has_many :items, through: :avatar_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true

  def default_values
    self.wallet = 70
  end
end
