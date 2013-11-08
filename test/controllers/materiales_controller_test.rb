require 'test_helper'

class MaterialesControllerTest < ActionController::TestCase
  setup do
    @materiale = materiales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materiales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materiale" do
    assert_difference('Materiale.count') do
      post :create, materiale: { description: @materiale.description, footprint: @materiale.footprint, level: @materiale.level, lower_limit: @materiale.lower_limit, manufacture: @materiale.manufacture, mark: @materiale.mark, item: @materiale.item, onyx_p_n: @materiale.onyx_p_n, p_n: @materiale.p_n, quantity: @materiale.quantity, remark: @materiale.remark, role: @materiale.role, substitute_code: @materiale.substitute_code, substitute_p_n: @materiale.substitute_p_n, type: @materiale.type }
    end

    assert_redirected_to materiale_path(assigns(:materiale))
  end

  test "should show materiale" do
    get :show, id: @materiale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materiale
    assert_response :success
  end

  test "should update materiale" do
    patch :update, id: @materiale, materiale: { description: @materiale.description, footprint: @materiale.footprint, level: @materiale.level, lower_limit: @materiale.lower_limit, manufacture: @materiale.manufacture, mark: @materiale.mark, item: @materiale.item, onyx_p_n: @materiale.onyx_p_n, p_n: @materiale.p_n, quantity: @materiale.quantity, remark: @materiale.remark, role: @materiale.role, substitute_code: @materiale.substitute_code, substitute_p_n: @materiale.substitute_p_n, type: @materiale.type }
    assert_redirected_to materiale_path(assigns(:materiale))
  end

  test "should destroy materiale" do
    assert_difference('Materiale.count', -1) do
      delete :destroy, id: @materiale
    end

    assert_redirected_to materiales_path
  end
end
