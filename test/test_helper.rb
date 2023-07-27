# test/test_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

module TestHelper
  # Define a method to simulate user login and return the JWT token
  def login(user, password)
    post login_path, params: { username: user.username, password: password }
    JSON.parse(response.body)['token']
  end
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Include the TestHelper module in the test cases
  include TestHelper
end
