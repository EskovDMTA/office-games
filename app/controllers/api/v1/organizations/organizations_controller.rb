module Api
  module V1
    module Organizations
      class OrganizationsController < Api::V1::Organizations::ApplicationController
        before_action :set_organization, only: %i[update destroy show]
        before_action :authorize_organization, only: %i[update destroy]

        def index
          @organizations = Organization.all
          render format: :json
        end

        def show
          render format: :json
        end

        def create
          authorize Organization, policy_class: OrganizationPolicy
          organization = current_user.build_owner_organization(organization_params)
          if organization.save
            current_user.update(organization_id: organization.id)
            render json: { message: "Ваша организация \"#{organization.name}\" создана" }, status: :created
          end
        rescue => e
          render json: { error: "Произошла ошибка при сохранении записи:#{e.message}" }, status: :unprocessable_entity
        end

        def update
          if @organization.update!(organization_params)
            render json: { message: "Организация успешно обновлена" }, status: :ok
          else
            render json: { error: @organization.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          @organization.destroy
          render json: { message: "Организация успешно удалена" }, status: :ok
        end

        private

        def set_organization
          @organization = Organization.find(params[:id])
        end

        def organization_params
          params.require(:organization).permit(:name, :description, :address, :email, :telegram)
        end

        def authorize_organization
          authorize @organization, policy_class: OrganizationPolicy
        end

      end
    end
  end
end
