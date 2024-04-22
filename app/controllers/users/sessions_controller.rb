# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy
    @authenticated = true
    super
  end

  private

  def verify_signed_out_user
    current_user
    super
  end

  def repond_to_on_destroy
    if @authenticated && current_user.nil?
      render status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def respond_with(resource, _opts = {})
    if resource
      render json: {
        user: current_user.as_json(except: :jti)
      }, status: :ok
    else
      render json: {
        messages: ["Invalid Email of Passwaord"]
      }, status: :unprocessable_entity
    end
  end
end
