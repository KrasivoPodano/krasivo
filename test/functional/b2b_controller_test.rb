require 'test_helper'

class B2bControllerTest < ActionController::TestCase
  test "should get food" do
    get :food
    assert_response :success
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end

  test "should get catering" do
    get :catering
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
