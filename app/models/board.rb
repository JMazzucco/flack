class Board < ApplicationRecord
  belongs_to :organization
  has_many :lists
  has_many :cards
end
