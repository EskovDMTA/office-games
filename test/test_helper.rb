ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

  end
end

module ActionDispatch
  class IntegrationTest
    def registration_user
      post user_registration_path params: { user:
                                              {
                                                email: "admin@mail.ru",
                                                password: "qwerty123",
                                                password_confirmation: "qwerty123"
                                              }
      }
      puts response.as_json
    end

  end
end
