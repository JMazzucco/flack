class User < ApplicationRecord
  has_many :user_boards
  has_many :boards, through: :user_boards
  has_many :user_cards
  has_many :cards, through: :user_cards
end
