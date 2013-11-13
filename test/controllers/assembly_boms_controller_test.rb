require 'test_helper'

class AssemblyBomsControllerTest < ActionController::TestCase
  setup do
    @assembly_bom = assembly_boms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assembly_boms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assembly_bom" do
    assert_difference('AssemblyBom.count') do
      post :create, assembly_bom: { business_id: @assembly_bom.business_id, kind: @assembly_bom.kind, name: @assembly_bom.name, onyx_p_n: @assembly_bom.onyx_p_n, order_id: @assembly_bom.order_id, p_n: @assembly_bom.p_n, product: @assembly_bom.product, quantity: @assembly_bom.quantity, remark: @assembly_bom.remark }
    end

    assert_redirected_to assembly_bom_path(assigns(:assembly_bom))
  end

  test "should show assembly_bom" do
    get :show, id: @assembly_bom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assembly_bom
    assert_response :success
  end

  test "should update assembly_bom" do
    patch :update, id: @assembly_bom, assembly_bom: { business_id: @assembly_bom.business_id, kind: @assembly_bom.kind, name: @assembly_bom.name, onyx_p_n: @assembly_bom.onyx_p_n, order_id: @assembly_bom.order_id, p_n: @assembly_bom.p_n, product: @assembly_bom.product, quantity: @assembly_bom.quantity, remark: @assembly_bom.remark }
    assert_redirected_to assembly_bom_path(assigns(:assembly_bom))
  end

  test "should destroy assembly_bom" do
    assert_difference('AssemblyBom.count', -1) do
      delete :destroy, id: @assembly_bom
    end

    assert_redirected_to assembly_boms_path
  end
end
