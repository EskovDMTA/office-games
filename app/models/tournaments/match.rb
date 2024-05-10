class Tournaments::Match < ApplicationRecord
  belongs_to :tournament, class_name: 'Tournaments::Tournament'
  has_one :match_result, class_name: 'Tournaments::MatchResult', foreign_key: :match_id
  belongs_to :participant1, polymorphic: true
  belongs_to :participant2, polymorphic: true

  validate :match_date_within_tournament_duration

  def match_date_within_tournament_duration
    unless tournaments_tournament.start_date <= match_date && match_date <= tournaments_tournament.end_date
      errors.add(:match_date, "дата матча не может выходить за временной промежуток проведения турнира")
    end
  end

end
