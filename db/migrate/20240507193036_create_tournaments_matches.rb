class CreateTournamentsMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments_matches do |t|
      t.references :tournament, null: false, foreign_key: {to_table: 'tournaments_tournaments'}
      t.references :participant1, polymorphic: true
      t.references :participant2, polymorphic: true
      t.datetime :match_date

      t.timestamps
    end
  end
end
