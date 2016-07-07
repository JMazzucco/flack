class CreateWebhooks < ActiveRecord::Migration[5.0]
  def change
    create_table :webhooks do |t|
      t.boolean :active
      t.string :description
      t.string :callback_url
      t.string :trello_id
      t.string :trello_id_model
      t.timestamps
    end
  end
end

