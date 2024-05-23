# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_17_121855) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type"
    t.integer "commentable_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "games_count"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status", default: 0
    t.bigint "game_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_type_id"], name: "index_games_on_game_type_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "email"
    t.string "telegram"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_organizations_on_owner_id"
  end

  create_table "team_users", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "captain_id", null: false
    t.index ["captain_id"], name: "index_teams_on_captain_id"
    t.index ["organization_id"], name: "index_teams_on_organization_id"
  end

  create_table "tournaments_match_results", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.string "participant1_type"
    t.bigint "participant1_id"
    t.string "participant2_type"
    t.bigint "participant2_id"
    t.string "winner_type"
    t.bigint "winner_id"
    t.integer "participant1_score"
    t.integer "participant2_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_tournaments_match_results_on_match_id"
    t.index ["participant1_type", "participant1_id"], name: "index_tournaments_match_results_on_participant1"
    t.index ["participant2_type", "participant2_id"], name: "index_tournaments_match_results_on_participant2"
    t.index ["winner_type", "winner_id"], name: "index_tournaments_match_results_on_winner"
  end

  create_table "tournaments_matches", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.string "participant1_type"
    t.bigint "participant1_id"
    t.string "participant2_type"
    t.bigint "participant2_id"
    t.datetime "match_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant1_type", "participant1_id"], name: "index_tournaments_matches_on_participant1"
    t.index ["participant2_type", "participant2_id"], name: "index_tournaments_matches_on_participant2"
    t.index ["tournament_id"], name: "index_tournaments_matches_on_tournament_id"
  end

  create_table "tournaments_tournament_bids", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "tournament_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_tournaments_tournament_bids_on_team_id"
    t.index ["tournament_id"], name: "index_tournaments_tournament_bids_on_tournament_id"
  end

  create_table "tournaments_tournament_results", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.string "participant_type", null: false
    t.bigint "participant_id", null: false
    t.integer "placement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_type", "participant_id"], name: "index_tournaments_tournament_results_on_participant"
    t.index ["tournament_id"], name: "index_tournaments_tournament_results_on_tournament_id"
  end

  create_table "tournaments_tournaments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id", null: false
    t.json "bracket"
    t.string "bracket_type", null: false
    t.index ["game_id"], name: "index_tournaments_tournaments_on_game_id"
    t.index ["organization_id"], name: "index_tournaments_tournaments_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "profession"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.boolean "admin", default: false
    t.bigint "organization_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "game_types"
  add_foreign_key "organizations", "users", column: "owner_id"
  add_foreign_key "team_users", "teams"
  add_foreign_key "team_users", "users"
  add_foreign_key "teams", "organizations"
  add_foreign_key "teams", "users", column: "captain_id"
  add_foreign_key "tournaments_match_results", "tournaments_matches", column: "match_id"
  add_foreign_key "tournaments_matches", "tournaments_tournaments", column: "tournament_id"
  add_foreign_key "tournaments_tournament_bids", "teams"
  add_foreign_key "tournaments_tournament_bids", "tournaments_tournaments", column: "tournament_id"
  add_foreign_key "tournaments_tournament_results", "tournaments_tournaments", column: "tournament_id"
  add_foreign_key "tournaments_tournaments", "games"
  add_foreign_key "tournaments_tournaments", "organizations"
  add_foreign_key "users", "organizations"
end
