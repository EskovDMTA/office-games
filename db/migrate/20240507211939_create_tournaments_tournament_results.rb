class CreateTournamentsTournamentResults < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments_tournament_results do |t|
      t.references :tournament, null: false, foreign_key: {to_table: "tournaments_tournaments"}
      t.references :participant, null: false, polymorphic: true
      t.integer :placement

      t.timestamps
    end
  end
end
