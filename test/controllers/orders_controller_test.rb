require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get view_orders" do
    get :view_orders
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

end
