require 'test_helper'

class AttendEventsControllerTest < ActionController::TestCase
  setup do
    @attend_event = attend_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attend_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attend_event" do
    assert_difference('AttendEvent.count') do
      post :create, attend_event: {  }
    end

    assert_redirected_to attend_event_path(assigns(:attend_event))
  end

  test "should show attend_event" do
    get :show, id: @attend_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attend_event
    assert_response :success
  end

  test "should update attend_event" do
    patch :update, id: @attend_event, attend_event: {  }
    assert_redirected_to attend_event_path(assigns(:attend_event))
  end

  test "should destroy attend_event" do
    assert_difference('AttendEvent.count', -1) do
      delete :destroy, id: @attend_event
    end

    assert_redirected_to attend_events_path
  end
end
