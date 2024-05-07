class Tournaments::Match < ApplicationRecord
  belongs_to :tournaments_tournament, class_name: 'Tournaments::Tournament'
  has_one :tournaments_match_result, class_name: 'Tournaments::MatchResult'
  belongs_to :participant1, polymorphic: true
  belongs_to :participant2, polymorphic: true
end
