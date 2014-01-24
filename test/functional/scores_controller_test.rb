require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  test "should get new_calls" do
    get :new_calls
    assert_response :success
  end

  test "should get create_calls" do
    get :create_calls
    assert_response :success
  end

  test "should get new_wins" do
    get :new_wins
    assert_response :success
  end

  test "should get create_wins" do
    get :create_wins
    assert_response :success
  end

end
