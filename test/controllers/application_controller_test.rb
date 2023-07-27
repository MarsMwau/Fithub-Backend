require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john_doe) # Assuming you have fixture data set up for users
  end

  test "should set current_user based on valid JWT token" do
    # Assuming you have a login method that logs in a user and returns the JWT token.
    token = login(@user, 'secret123')

    # Assuming you have an authenticated_route method in the ApplicationController
    get authenticated_route_path, headers: { 'Authorization' => "Bearer #{token}" }
    assert_response :success

    # Assuming your authenticated_route method returns some data about the user
    assert_equal @user.id, JSON.parse(response.body)['user']['id']
  end

  test "should return unauthorized with invalid JWT token" do
    get authenticated_route_path, headers: { 'Authorization' => "Bearer invalid_token" }
    assert_response :unauthorized
  end

  test "should return unauthorized without JWT token" do
    get authenticated_route_path
    assert_response :unauthorized
  end
end
