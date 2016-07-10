class CreateUserOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_organizations do |t|
      t.references :user, index: true
      t.references :organization, index: true
    end
  end
end
