class CreateUserCards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cards do |t|
      t.references :user, index: true
      t.references :card, index: true
    end
  end
end
