module BracketService
  class BracketLoader
    include BracketHelper

    attr_reader :tournament

    def initialize(tournament)
      @tournament = tournament
    end

    def load_bracket
      if @tournament.bracket
        load_bracket_from_database
      else
        raise StandardError.new("Турнирная сетка еще не сформирована")
      end
    rescue StandardError => e
      render_error(e.message)
    end

    private

    def load_bracket_from_database
      klass = Object.const_get(bracket_class_name)
      klass.from_json @tournament.bracket
    end

    def render_error(message)
      render json: { message: message }, status: :unprocessable_entity
    end

  end
end
