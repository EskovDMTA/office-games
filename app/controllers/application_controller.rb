class ApplicationController < ActionController::API
  # before_action :authenticate_user!
  include Pundit::Authorization
  respond_to :json
end
