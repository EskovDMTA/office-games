class CreateTournamentsTournaments < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments_tournaments do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
