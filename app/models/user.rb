class User < ApplicationRecord
  has_many :user_boards
  has_many :boards, through: :user_boards
  has_many :user_cards
  has_many :cards, through: :user_cards

  def find_or_create_from_omniauth(auth)
    User.find_or_create_by(uid: auth["uid"]).tap do |u|
      u.name = auth["info"]["name"]
      u.email = auth["info"]["email"]
      u.trello_username = auth["info"]["nickname"]
      u.token = auth["credentials"]["token"]
      u.secret = auth["credentials"]["secret"]
      u.save
    end
  end
end

