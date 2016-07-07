class CreateUserBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_boards do |t|
      t.references :user, index: true
      t.references :board, index: true
    end
  end
end
