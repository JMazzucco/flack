class AddTrelloModelTypeToWebhooks < ActiveRecord::Migration[5.0]
  def change

    add_column :webhooks, :trello_model_type, :string
  end
end
