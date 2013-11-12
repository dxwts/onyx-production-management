require 'test_helper'

class PackagingRequirementsControllerTest < ActionController::TestCase
  setup do
    @packaging_requirement = packaging_requirements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packaging_requirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packaging_requirement" do
    assert_difference('PackagingRequirement.count') do
      post :create, packaging_requirement: { auxiliary_board: @packaging_requirement.auxiliary_board, binding: @packaging_requirement.binding, box_capacity: @packaging_requirement.box_capacity, box_sticker: @packaging_requirement.box_sticker, mark_box: @packaging_requirement.mark_box, remark: @packaging_requirement.remark, tape: @packaging_requirement.tape }
    end

    assert_redirected_to packaging_requirement_path(assigns(:packaging_requirement))
  end

  test "should show packaging_requirement" do
    get :show, id: @packaging_requirement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packaging_requirement
    assert_response :success
  end

  test "should update packaging_requirement" do
    patch :update, id: @packaging_requirement, packaging_requirement: { auxiliary_board: @packaging_requirement.auxiliary_board, binding: @packaging_requirement.binding, box_capacity: @packaging_requirement.box_capacity, box_sticker: @packaging_requirement.box_sticker, mark_box: @packaging_requirement.mark_box, remark: @packaging_requirement.remark, tape: @packaging_requirement.tape }
    assert_redirected_to packaging_requirement_path(assigns(:packaging_requirement))
  end

  test "should destroy packaging_requirement" do
    assert_difference('PackagingRequirement.count', -1) do
      delete :destroy, id: @packaging_requirement
    end

    assert_redirected_to packaging_requirements_path
  end
end
