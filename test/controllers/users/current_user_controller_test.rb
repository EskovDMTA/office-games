require "test_helper"
require 'devise/jwt/test_helpers'

class Users::CurrentUserControllerTest < ActionDispatch::IntegrationTest
  def setup
    @jwt_user = users(:user)
  end

  test "should show current_user" do
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, @jwt_user)
    get users_current_user_url, headers: auth_headers

    assert_response :ok

    response_body = JSON.parse(response.body)
    assert(response_body["user"]["email"], @jwt_user.email)
  end
end
