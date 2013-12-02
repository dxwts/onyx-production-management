require 'test_helper'

class CustomTablesControllerTest < ActionController::TestCase
  setup do
    @custom_table = custom_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_table" do
    assert_difference('CustomTable.count') do
      post :create, custom_table: {  }
    end

    assert_redirected_to custom_table_path(assigns(:custom_table))
  end

  test "should show custom_table" do
    get :show, id: @custom_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_table
    assert_response :success
  end

  test "should update custom_table" do
    patch :update, id: @custom_table, custom_table: {  }
    assert_redirected_to custom_table_path(assigns(:custom_table))
  end

  test "should destroy custom_table" do
    assert_difference('CustomTable.count', -1) do
      delete :destroy, id: @custom_table
    end

    assert_redirected_to custom_tables_path
  end
end
