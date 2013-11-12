require 'test_helper'

class RegisterOrdersControllerTest < ActionController::TestCase
  setup do
    @register_order = register_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:register_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create register_order" do
    assert_difference('RegisterOrder.count') do
      post :create, register_order: { color: @register_order.color, customer: @register_order.customer, delivery_time: @register_order.delivery_time, product: @register_order.product, quantity: @register_order.quantity, register_orders_id: @register_order.register_orders_id, remark: @register_order.remark, time: @register_order.time, user: @register_order.user, version: @register_order.version }
    end

    assert_redirected_to register_order_path(assigns(:register_order))
  end

  test "should show register_order" do
    get :show, id: @register_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @register_order
    assert_response :success
  end

  test "should update register_order" do
    patch :update, id: @register_order, register_order: { color: @register_order.color, customer: @register_order.customer, delivery_time: @register_order.delivery_time, product: @register_order.product, quantity: @register_order.quantity, register_orders_id: @register_order.register_orders_id, remark: @register_order.remark, time: @register_order.time, user: @register_order.user, version: @register_order.version }
    assert_redirected_to register_order_path(assigns(:register_order))
  end

  test "should destroy register_order" do
    assert_difference('RegisterOrder.count', -1) do
      delete :destroy, id: @register_order
    end

    assert_redirected_to register_orders_path
  end
end
