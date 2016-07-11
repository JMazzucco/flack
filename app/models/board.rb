class Board < ApplicationRecord
  belongs_to :organization
  has_many :lists
  has_many :cards
  has_many :user_boards
  has_many :users, through: :boards
  belongs_to :creator, class_name: "User"

  validates :trello_id, uniqueness: true, presence: true

  def self.create_from_trello_payload(trello_id:, name:, url:, description:, organization:)
    Board.find_or_create_by(trello_id: trello_id).tap do |board|
      board.name = name
      board.url = "http://trello.com/boards/b/#{url}/#{board.name}"
      board.description = description
      board.organization = organization
      board.save
    end
  end
end
