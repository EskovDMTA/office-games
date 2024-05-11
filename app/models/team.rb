class Team < ApplicationRecord
  belongs_to :organization
  belongs_to :captain, class_name: "User", optional: true
  has_many :team_users
  has_many :users, through: :team_users
  has_many :tournament_bids, class_name: 'Tournaments::TournamentBid', dependent: :destroy

  has_many :tournaments_matches, class_name: 'Tournaments::Match', as: :participant1
  has_many :tournaments_matches, class_name: 'Tournaments::Match', as: :participant2

  has_many :tournaments_match_results, class_name: 'Tournaments::MatchResult', as: :participant1
  has_many :tournaments_match_results, class_name: 'Tournaments::MatchResult', as: :participant2

  has_many :tournaments, class_name: 'Tournaments::Tournament', as: :winner
end
