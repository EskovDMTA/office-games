class DoubleEliminationService
  attr_reader :tournament

  def initialize(tournament)
    @tournament = tournament
  end

  def generate_matches
    winners_bracket_matches = generate_winners_bracket_matches
    lower_bracket_matches = generate_losers_bracket_matches(winners_bracket_matches)
  end


  private

  def generate_winners_bracket_matches
    
  end

  def generate_losers_bracket_matches(winners_bracket_matches)
    losers_matches = []

    winners_bracket_matches.each.slice(2) do |match1, match2|
      looser1 = match1.looser
      looser2 = match2.looser

    end
  end

  def create_match(team1,team2)
    Tournaments::Match.create!(tournament:, participant1: team1, participant1: team2 )
  end

  def save_matches(matches)
  end
end
