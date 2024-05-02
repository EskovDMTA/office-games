class AddCapitanToTeams < ActiveRecord::Migration[7.1]
  def change
    add_reference :teams, :captain, null: false, foreign_key: { to_table: :users }
  end
end
