class Tournaments::MatchResult < ApplicationRecord
  belongs_to :tournaments_match, class_name: 'Tournaments::Match'

  belongs_to :participant1, polymorphic: true
  belongs_to :participant2, polymorphic: true
  belongs_to :winner, polymorphic: true
end
