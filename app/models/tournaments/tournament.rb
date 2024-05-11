class Tournaments::Tournament < ApplicationRecord
  has_many :results, class_name: 'Tournaments::TournamentResult', dependent: :destroy
  has_many :matches, class_name: 'Tournaments::Match', dependent: :destroy
  has_many :tournament_bids, class_name: 'Tournaments::TournamentBid', dependent: :destroy
  belongs_to :game
  belongs_to :organization
end
