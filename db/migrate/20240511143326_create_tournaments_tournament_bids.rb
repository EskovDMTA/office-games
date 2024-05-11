class CreateTournamentsTournamentBids < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments_tournament_bids do |t|
      t.references :team, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: { to_table: "tournaments_tournaments" }
      t.string :status

      t.timestamps
    end
  end
end
