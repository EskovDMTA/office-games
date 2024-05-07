class Tournaments::Tournament < ApplicationRecord
  has_many :tournaments_tournament_results, class_name: 'Tournaments::TournamentResult'
  belongs_to :game
end
