class Card < ApplicationRecord
  belongs_to :list
  belongs_to :board
  has_many :user_cards
  has_many :users, through: :user_cards
  belongs_to :creator, class_name: "User"
  validates :trello_id, uniqueness: true, presence: true

end
