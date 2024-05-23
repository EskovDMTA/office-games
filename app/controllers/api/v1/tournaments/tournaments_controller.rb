module Api
  module V1
    module Tournaments
      class TournamentsController < Api::V1::Tournaments::ApplicationController
        before_action :set_organization, only: %i[index create generate_bracket bracket]
        before_action :set_tournament, only: %i[ show update destroy generate_bracket bracket]
        before_action :authorize_tournament, only: %i[create update destroy generate_bracket]
        def index
          @tournaments = ::Tournaments::Tournament.where(organization_id: @organization.id)
          render format: :json
        end

        def create
          tournament = @organization.tournaments.create!(tournament_params)
          render json: { message: "#{ tournament.name } успешно создан" }, status: :ok
        rescue => e
          render json: { error: "Произошла ошибка при сохранении записи:#{ e.message }" }, status: :unprocessable_entity
        end

        def show
          render format: :json
        end

        def update
          if @tournament.update(tournament_params)
            render json: { message: "Турнир успешно обновлен" }, status: :ok
          else
            render json: { error: @tournament.errors.full_messages }, status: :unprocessable_entity

          end
        end

        def destroy
          @tournament.destroy
          render json: { message: "#{ @tournament.name } успешно удален" }, status: :ok
        rescue => e
          render json: { error: "Произошла ошибка при удалении соревнования:#{ e.message }" }, status: :unprocessable_entity
        end

        def generate_bracket
          if @tournament.bracket
            render json: { error: "Bracket already exists for this tournament" }, status: :unprocessable_entity
          else
            bracket_creator = BracketService::BracketCreator.new(@tournament)
            bracket = bracket_creator.create_bracket
            @tournament.update!(bracket: bracket.to_json)
            render json: { message: "Bracket successfully generated" }, status: :ok
          end
        rescue ActiveRecord::RecordNotFound => e
          render json: { error: "Tournament not found" }, status: :not_found
        rescue StandardError => e
          render json: { error: e.message }, status: :unprocessable_entity
        end

        def bracket
          bracket_loader = BracketService::BracketLoader.new(@tournament)
          @bracket = bracket_loader.load_bracket
          render format: :json
        end


        private

        def tournament_params
          params.require(:tournament).permit(:name, :description, :start_date, :end_date, :game_id)
        end

        def set_tournament
          @tournament = ::Tournaments::Tournament.find(params[:id])
        end

        def set_organization
          @organization = Organization.find_by(owner_id: current_user.id)
          raise ActiveRecord::RecordNotFound, "Организация не найдена у текущего пользователя" if @organization.nil?
        rescue ActiveRecord::RecordNotFound => e
          render json: { error: e.message }, status: :not_found
        end

        def authorize_tournament
          authorize @organization, policy_class: TournamentPolicy
        end
      end
    end
  end
end
