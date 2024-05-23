module Api
  module V1
    module Organizations
      class TeamsController < Api::V1::Organizations::ApplicationController

        def index
          @teams = Team.where(organization_id: params[:organization_id])
          render format: :json
        end

        private

      end
    end
  end
end
