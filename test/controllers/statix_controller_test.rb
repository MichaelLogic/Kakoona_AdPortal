require 'test_helper'

class StatixControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get future" do
    get :future
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
