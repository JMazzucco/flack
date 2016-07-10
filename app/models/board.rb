class Board < ApplicationRecord
  belongs_to :organization
  has_many :lists
  has_many :cards

  validates :trello_id, uniqueness: true, presence: true
end
