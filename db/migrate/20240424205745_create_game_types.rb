class CreateGameTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :game_types do |t|
      t.string :name
      t.string :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
