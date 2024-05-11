module Api
  module V1
    module Tournaments
      class TournamentsBidsController < Api::V1::Tournaments::ApplicationController
        def index
          @applications = @tournament.tournament_applications
        end
      end
    end
  end
end
