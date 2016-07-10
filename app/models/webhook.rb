class Webhook < ApplicationRecord
  validates :trello_id, uniqueness: true, presence: true
  validates :trello_model_id, uniqueness: true


  def trello_model
    eval("#{self.trello_model_type}.find_by(trell_id: #{self.trello_id_model})")
  end
end


