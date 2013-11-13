require 'test_helper'

class BomsControllerTest < ActionController::TestCase
  setup do
    @bom = boms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bom" do
    assert_difference('Bom.count') do
      post :create, bom: { description: @bom.description, footprint: @bom.footprint, mark: @bom.mark, onyx_p_n: @bom.onyx_p_n, p_n: @bom.p_n, product: @bom.product, quantity: @bom.quantity, reference: @bom.reference, remark: @bom.remark, state: @bom.state, substitute_code: @bom.substitute_code, substitute_mark: @bom.substitute_mark, substitute_p_n: @bom.substitute_p_n, type: @bom.type, version: @bom.version }
    end

    assert_redirected_to bom_path(assigns(:bom))
  end

  test "should show bom" do
    get :show, id: @bom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bom
    assert_response :success
  end

  test "should update bom" do
    patch :update, id: @bom, bom: { description: @bom.description, footprint: @bom.footprint, mark: @bom.mark, onyx_p_n: @bom.onyx_p_n, p_n: @bom.p_n, product: @bom.product, quantity: @bom.quantity, reference: @bom.reference, remark: @bom.remark, state: @bom.state, substitute_code: @bom.substitute_code, substitute_mark: @bom.substitute_mark, substitute_p_n: @bom.substitute_p_n, type: @bom.type, version: @bom.version }
    assert_redirected_to bom_path(assigns(:bom))
  end

  test "should destroy bom" do
    assert_difference('Bom.count', -1) do
      delete :destroy, id: @bom
    end

    assert_redirected_to boms_path
  end
end
