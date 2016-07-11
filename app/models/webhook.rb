class Webhook < ApplicationRecord
  validates :trello_id, uniqueness: true, presence: true
  validates :trello_id_model, uniqueness: true


  def trello_model
    eval("#{self.trello_model_type.capitalize}.find_by(trello_id: #{self.trello_id_model})") if self.trello_id_model
  end
end


