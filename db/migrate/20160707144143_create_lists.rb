class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :closed
      t.references :board, index: true
      t.string :trello_id
      t.timestamps
    end
  end
end
