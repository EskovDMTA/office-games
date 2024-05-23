class AddOrganizationToTournaments < ActiveRecord::Migration[7.1]
  def change
    add_reference :tournaments_tournaments, :organization, foreign_key: true, null: false
  end
end
