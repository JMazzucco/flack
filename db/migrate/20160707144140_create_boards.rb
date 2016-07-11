class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :description
      t.string :url
      t.boolean :closed
      t.string :trello_id
      t.references :organization, index: true
      t.string :creator_id
      t.timestamps
    end
  end
end
