require 'test_helper'

class BomEventsControllerTest < ActionController::TestCase
  setup do
    @bom_event = bom_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bom_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bom_event" do
    assert_difference('BomEvent.count') do
      post :create, bom_event: { event: @bom_event.event }
    end

    assert_redirected_to bom_event_path(assigns(:bom_event))
  end

  test "should show bom_event" do
    get :show, id: @bom_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bom_event
    assert_response :success
  end

  test "should update bom_event" do
    patch :update, id: @bom_event, bom_event: { event: @bom_event.event }
    assert_redirected_to bom_event_path(assigns(:bom_event))
  end

  test "should destroy bom_event" do
    assert_difference('BomEvent.count', -1) do
      delete :destroy, id: @bom_event
    end

    assert_redirected_to bom_events_path
  end
end
