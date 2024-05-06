module Api
  module V1
    class TeamsController < Api::V1::ApplicationController
      before_action :set_team, only: %i[ show update destroy ]
      before_action :authorize_team, only: %i[ update destroy ]

      def show
        render format: :json
      end

      def create
        authorize Team
        team = current_user.teams.create!(teams_params.merge(organization_id: current_user.organization_id))

        render json: {message: "Ваша команда '#{team.name}' создана"}, status: :created
      rescue => e
        render json: { error: "Произошла ошибка при создании команды:#{e.message}" }, status: :unprocessable_entity
      end

      def update
        if @team.update!(teams_params)
          render json: { message: "Команда успешно обновлена" }, status: :ok
        else
          render json: { error: @team.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @team.destroy
        render json: {message: "Команда удалена #{@team.name}"}, status: :ok
      end

      private

      def set_team
        @team = Team.find(params[:id])
      end

      def teams_params
        params.require(:team).permit(:name, :description)
      end

      def authorize_team
        authorize @team
      end

    end
  end
end
