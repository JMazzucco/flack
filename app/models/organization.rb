class Organization < ApplicationRecord
  has_many :boards
  has_many :user_organizations
  has_many :users, through: :user_organizations

  validates :trello_id, uniqueness: true, presence: true

end
