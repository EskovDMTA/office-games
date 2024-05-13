module Api
  module V1
    module Tournaments
      class TournamentBidsController < Api::V1::Tournaments::ApplicationController
        before_action :set_tournament

        def index
          @organization = Organization.find(@tournament.organization.id)
          authorize @tournament, policy_class: ::TournamentBidPolicy
          @bids = @tournament.tournament_bids
        end

        def create
          @bid = @tournament.tournament_bids.new(bids_params)
          authorize @bid, policy_class: ::TournamentBidPolicy
          if @bid.save
            render json: @bid, status: :created
          else
            render json: @bid.errors, status: :unprocessable_entity
          end
        end

        def approve
          @bid.approve!
          render json: @bid
        end

        def reject
          @bid.rejected!
          render json: @bid
        end

        private

        def set_tournament
          @tournament = ::Tournaments::Tournament.find(params[:tournament_id])
        end

        def set_bid
          @bid = @tournament.tournament_bids.find(params[:id])
        end

        def bids_params
          params.require(:tournament_bid).permit(:team_id)
        end

      end
    end
  end
end
