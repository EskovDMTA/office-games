class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.integer :status, default: 0
      t.references :game_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
