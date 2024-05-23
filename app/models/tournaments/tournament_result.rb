class Tournaments::TournamentResult < ApplicationRecord
  belongs_to :tournament
  belongs_to :participant, polymorphic: true
end
