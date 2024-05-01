class Api::ApplicationController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :authorization_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  private

  def authorization_error
    render json: {error: "Ошибка доступа"}, status: :forbidden
  end

  def not_found_error(exception)
    resource_name = exception.model.constantize.model_name.human.downcase
    render json: { error: "#{resource_name} не найден" }, status: :not_found
  end
end
