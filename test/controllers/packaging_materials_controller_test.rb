require 'test_helper'

class PackagingMaterialsControllerTest < ActionController::TestCase
  setup do
    @packaging_material = packaging_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packaging_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packaging_material" do
    assert_difference('PackagingMaterial.count') do
      post :create, packaging_material: { box: @packaging_material.box, dust_proof_bag: @packaging_material.dust_proof_bag, ean13_code: @packaging_material.ean13_code, help: @packaging_material.help, inside_box: @packaging_material.inside_box, quick_help: @packaging_material.quick_help, remark: @packaging_material.remark, serial_number: @packaging_material.serial_number, warranty_card: @packaging_material.warranty_card }
    end

    assert_redirected_to packaging_material_path(assigns(:packaging_material))
  end

  test "should show packaging_material" do
    get :show, id: @packaging_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packaging_material
    assert_response :success
  end

  test "should update packaging_material" do
    patch :update, id: @packaging_material, packaging_material: { box: @packaging_material.box, dust_proof_bag: @packaging_material.dust_proof_bag, ean13_code: @packaging_material.ean13_code, help: @packaging_material.help, inside_box: @packaging_material.inside_box, quick_help: @packaging_material.quick_help, remark: @packaging_material.remark, serial_number: @packaging_material.serial_number, warranty_card: @packaging_material.warranty_card }
    assert_redirected_to packaging_material_path(assigns(:packaging_material))
  end

  test "should destroy packaging_material" do
    assert_difference('PackagingMaterial.count', -1) do
      delete :destroy, id: @packaging_material
    end

    assert_redirected_to packaging_materials_path
  end
end
