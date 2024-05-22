module BracketService
  class BracketCreator
    include BracketHelper

    attr_reader :tournament

    def initialize(tournament)
      @tournament = tournament
    end

    def create_bracket
      teams = approved_teams
      build_bracket(teams)
    end

    private

    def build_bracket(teams)
      klass = Object.const_get(bracket_class_name)
      klass.by_size(teams.size).seed teams
    end

    def approved_teams
      @approved_team ||= @tournament.tournament_bids.where(status: :approved).shuffle
    end
  end
end
