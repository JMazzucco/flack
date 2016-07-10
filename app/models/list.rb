class List < ApplicationRecord
  belongs_to :board
  has_many :cards

  validates :trello_id, uniqueness: true, presence: true

end
