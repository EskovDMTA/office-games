class HomesController < ApplicationController
  def home
    render json: { page: "home_page", status: :ok }
  end
end
