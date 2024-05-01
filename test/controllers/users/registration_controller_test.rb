# frozen_string_literal: true
require 'test_helper'

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should registration" do
    post user_registration_path, params: {user: {
      email: "mail@mail.ru",
      password: "qwerty123",
      password_confirmation: "qwerty123"
    }}, as: :json
    user = User.last
    assert(user.email, "mail@mail.ru")
  end

end
