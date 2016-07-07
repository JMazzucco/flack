class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :description
      t.string :display_name
      t.string :name
      t.string :url
      t.string :trello_id
      t.timestamps
    end
  end
end
