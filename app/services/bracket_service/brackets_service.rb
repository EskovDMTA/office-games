module BracketService
  class TournamentBracket
    attr_reader :tournament

    def initialize(tournament)
      @tournament = tournament
    end

    def winner_team(team)

    end

    def set_bracket
      if @tournament.bracket
        get_bracket_from_bd
      else
        @bracket = Factory.create_bracket(@tournament.bracket_type, approved_teams.size)
      end
    end

    def save_bracket
      @tournament.update!(bracket: @bracket.to_json)
    end


    private

    def get_bracket_from_bd
      class_name = "BracketTree::Bracket::#{@tournament.bracket_type}"
      klass = Object.const_get(class_name)
      @bracket = klass.from_json @tournament.bracket
    end

    def approved_teams
      @tournament.tournament_bids.where(status: :approved).pluck(:team_id).shuffle
    end

  end
end
