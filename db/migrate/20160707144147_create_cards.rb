class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :description
      t.datetime :due
      t.string :url
      t.boolean :closed
      t.string :trello_id
      t.string :short_trello_id
      t.string :badges
      t.text :card_labels, array: true, default: []
      t.references :board, index: true
      t.references :list, index: true
      t.string :creator_id
      t.timestamps
    end
  end
end
