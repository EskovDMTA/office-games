class Tournaments::Tournament < ApplicationRecord
  has_many :tournaments_tournament_results, class_name: 'Tournaments::TournamentResult'
  has_many :tournaments_matches, :class_name => 'Tournaments::Match'
  belongs_to :game
end
