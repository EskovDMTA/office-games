class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :email
      t.string :telegram
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
