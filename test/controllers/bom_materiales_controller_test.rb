require 'test_helper'

class BomMaterialesControllerTest < ActionController::TestCase
  setup do
    @bom_materiale = bom_materiales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bom_materiales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bom_materiale" do
    assert_difference('BomMateriale.count') do
      post :create, bom_materiale: { description: @bom_materiale.description, document: @bom_materiale.document, footprint: @bom_materiale.footprint, manufacture: @bom_materiale.manufacture, mark: @bom_materiale.mark, onyx_p_n: @bom_materiale.onyx_p_n, p_n: @bom_materiale.p_n, quantity: @bom_materiale.quantity, reference: @bom_materiale.reference, remark: @bom_materiale.remark, state: @bom_materiale.state, substitute_code: @bom_materiale.substitute_code, substitute_mark: @bom_materiale.substitute_mark, substitute_p_n: @bom_materiale.substitute_p_n, type: @bom_materiale.type, version: @bom_materiale.version }
    end

    assert_redirected_to bom_materiale_path(assigns(:bom_materiale))
  end

  test "should show bom_materiale" do
    get :show, id: @bom_materiale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bom_materiale
    assert_response :success
  end

  test "should update bom_materiale" do
    patch :update, id: @bom_materiale, bom_materiale: { description: @bom_materiale.description, document: @bom_materiale.document, footprint: @bom_materiale.footprint, manufacture: @bom_materiale.manufacture, mark: @bom_materiale.mark, onyx_p_n: @bom_materiale.onyx_p_n, p_n: @bom_materiale.p_n, quantity: @bom_materiale.quantity, reference: @bom_materiale.reference, remark: @bom_materiale.remark, state: @bom_materiale.state, substitute_code: @bom_materiale.substitute_code, substitute_mark: @bom_materiale.substitute_mark, substitute_p_n: @bom_materiale.substitute_p_n, type: @bom_materiale.type, version: @bom_materiale.version }
    assert_redirected_to bom_materiale_path(assigns(:bom_materiale))
  end

  test "should destroy bom_materiale" do
    assert_difference('BomMateriale.count', -1) do
      delete :destroy, id: @bom_materiale
    end

    assert_redirected_to bom_materiales_path
  end
end
