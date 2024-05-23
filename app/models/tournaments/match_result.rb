class Tournaments::MatchResult < ApplicationRecord
  before_validation :set_participants_from_match, :set_winner

  belongs_to :match, class_name: 'Tournaments::Match'

  belongs_to :participant1, polymorphic: true
  belongs_to :participant2, polymorphic: true
  belongs_to :winner, polymorphic: true

  def set_participants_from_match
    self.participant1 = match.participant1
    self.participant2 = match.participant2
  end

  def set_winner
    self.participant1_score > self.participant2_score ?
      self.winner = self.participant1 :
      self.winner = self.participant2
  end
end
