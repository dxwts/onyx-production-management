require 'test_helper'

class FittingsControllerTest < ActionController::TestCase
  setup do
    @fitting = fittings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fittings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fitting" do
    assert_difference('Fitting.count') do
      post :create, fitting: { box: @fitting.box, dust_proof_bag: @fitting.dust_proof_bag, ean13_code: @fitting.ean13_code, help: @fitting.help, inside_box: @fitting.inside_box, quick_help: @fitting.quick_help, remark: @fitting.remark, serial_number: @fitting.serial_number, warranty_card: @fitting.warranty_card }
    end

    assert_redirected_to fitting_path(assigns(:fitting))
  end

  test "should show fitting" do
    get :show, id: @fitting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fitting
    assert_response :success
  end

  test "should update fitting" do
    patch :update, id: @fitting, fitting: { box: @fitting.box, dust_proof_bag: @fitting.dust_proof_bag, ean13_code: @fitting.ean13_code, help: @fitting.help, inside_box: @fitting.inside_box, quick_help: @fitting.quick_help, remark: @fitting.remark, serial_number: @fitting.serial_number, warranty_card: @fitting.warranty_card }
    assert_redirected_to fitting_path(assigns(:fitting))
  end

  test "should destroy fitting" do
    assert_difference('Fitting.count', -1) do
      delete :destroy, id: @fitting
    end

    assert_redirected_to fittings_path
  end
end
