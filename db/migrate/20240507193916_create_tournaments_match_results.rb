class CreateTournamentsMatchResults < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments_match_results do |t|
      t.references :match, null: false, foreign_key: {to_table: "tournaments_matches"}
      t.references :participant1, polymorphic: true
      t.references :participant2, polymorphic: true
      t.references :winner, polymorphic: true
      t.integer :participant1_score
      t.integer :participant2_score

      t.timestamps
    end
  end
end
