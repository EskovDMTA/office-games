module BracketService
  class TournamentBracket
    attr_reader :tournament

    def initialize(tournament)
      @tournament = tournament
    end

    def create_bracket
      build_bracket
    end

    def get_bracket
      if @tournament.bracket
        get_bracket_from_bd
      else
        render json: { message: "Турнирная сетка еще не сформирована" }, status: :unprocessable_entity
      end
    end

    def update_bracket
      @tournament.update!(bracket: build_bracket.to_json)
    end


    private

    def get_bracket_from_bd
      klass = Object.const_get(bracket_class_name)
      @bracket = klass.from_json @tournament.bracket
    end

    def build_bracket
      klass = Object.const_get(bracket_class_name)
      @bracket = klass.by_size approved_teams.size
      @bracket.seed approved_teams
      @bracket
    end

    def bracket_class_name
      "BracketTree::Bracket::#{@tournament.bracket_type}"
    end

    def approved_teams
      @tournament.tournament_bids.where(status: :approved).shuffle
    end

  end
end
