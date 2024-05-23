class AddBracketFieldToTournaments < ActiveRecord::Migration[7.1]
  def change
    add_column :tournaments_tournaments, :bracket, :json, null: true
  end
end
