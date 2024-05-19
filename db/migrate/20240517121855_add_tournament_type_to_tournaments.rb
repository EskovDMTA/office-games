class AddTournamentTypeToTournaments < ActiveRecord::Migration[7.1]
  def change
    add_column :tournaments_tournaments, :bracket_type, :string, null: false
  end
end
