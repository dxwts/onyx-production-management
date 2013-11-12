require 'test_helper'

class SoftwaresControllerTest < ActionController::TestCase
  setup do
    @software = softwares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:softwares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create software" do
    assert_difference('Software.count') do
      post :create, software: { boot_anim: @software.boot_anim, language: @software.language, os: @software.os, poweroff_anim: @software.poweroff_anim, remark: @software.remark, software_features: @software.software_features, standby_anim: @software.standby_anim }
    end

    assert_redirected_to software_path(assigns(:software))
  end

  test "should show software" do
    get :show, id: @software
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @software
    assert_response :success
  end

  test "should update software" do
    patch :update, id: @software, software: { boot_anim: @software.boot_anim, language: @software.language, os: @software.os, poweroff_anim: @software.poweroff_anim, remark: @software.remark, software_features: @software.software_features, standby_anim: @software.standby_anim }
    assert_redirected_to software_path(assigns(:software))
  end

  test "should destroy software" do
    assert_difference('Software.count', -1) do
      delete :destroy, id: @software
    end

    assert_redirected_to softwares_path
  end
end
