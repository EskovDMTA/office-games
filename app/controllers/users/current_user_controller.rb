class Users::CurrentUserController < ApplicationController
  def show
    render json: {
      user: current_user.as_json(except: :jti)
    }, status: :ok
  end
end
