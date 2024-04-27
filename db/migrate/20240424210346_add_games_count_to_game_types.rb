class AddGamesCountToGameTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :game_types, :games_count, :integer
  end
end
