class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :slack_username
      t.string :trello_username
      t.string :token
      t.string :secret
      t.string :name
      t.timestamps
    end
  end
end

