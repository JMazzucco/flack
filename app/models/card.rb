class Card < ApplicationRecord
  belongs_to :list
  belongs_to :board

  validates :trello_id, uniqueness: true, presence: true

end
