require 'test_helper'

class MaterialesEventsControllerTest < ActionController::TestCase
  setup do
    @materiales_event = materiales_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materiales_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materiales_event" do
    assert_difference('MaterialesEvent.count') do
      post :create, materiales_event: { event: @materiales_event.event, obj: @materiales_event.obj, quantity: @materiales_event.quantity, remark: @materiales_event.remark, user: @materiales_event.user }
    end

    assert_redirected_to materiales_event_path(assigns(:materiales_event))
  end

  test "should show materiales_event" do
    get :show, id: @materiales_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materiales_event
    assert_response :success
  end

  test "should update materiales_event" do
    patch :update, id: @materiales_event, materiales_event: { event: @materiales_event.event, obj: @materiales_event.obj, quantity: @materiales_event.quantity, remark: @materiales_event.remark, user: @materiales_event.user }
    assert_redirected_to materiales_event_path(assigns(:materiales_event))
  end

  test "should destroy materiales_event" do
    assert_difference('MaterialesEvent.count', -1) do
      delete :destroy, id: @materiales_event
    end

    assert_redirected_to materiales_events_path
  end
end
