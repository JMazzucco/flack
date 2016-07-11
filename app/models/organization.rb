class Organization < ApplicationRecord
  has_many :boards
  has_many :user_organizations
  has_many :users, through: :user_organizations
  belongs_to :creator, class_name: "User"
  validates :trello_id, uniqueness: true, presence: true

end
