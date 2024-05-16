class DoubleEliminationService
  attr_reader :tournament

  def initialize(tournament)
    @tournament = tournament
  end

  def destribute_team
    teams = @tournament.tournament_bids.where(status: :approved).pluck(:team_id).shuffle
    create_first_round_matches(teams)
  end

  private

  def create_first_round_matches(teams)
    round = 1
    matches = team.each.slice(2).to_a
    matches.each do |match|
      Tournaments::Match.create(tournament: @tournament, team1_id: match[0], team2_id: match[1])
    end
  end
end
