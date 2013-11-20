require 'test_helper'

class PendingFriendRequestsControllerTest < ActionController::TestCase
  setup do
    @pending_friend_request = pending_friend_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pending_friend_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pending_friend_request" do
    assert_difference('PendingFriendRequest.count') do
      post :create, pending_friend_request: { date_requested: @pending_friend_request.date_requested, from_user_id: @pending_friend_request.from_user_id, to_user_id: @pending_friend_request.to_user_id }
    end

    assert_redirected_to pending_friend_request_path(assigns(:pending_friend_request))
  end

  test "should show pending_friend_request" do
    get :show, id: @pending_friend_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pending_friend_request
    assert_response :success
  end

  test "should update pending_friend_request" do
    patch :update, id: @pending_friend_request, pending_friend_request: { date_requested: @pending_friend_request.date_requested, from_user_id: @pending_friend_request.from_user_id, to_user_id: @pending_friend_request.to_user_id }
    assert_redirected_to pending_friend_request_path(assigns(:pending_friend_request))
  end

  test "should destroy pending_friend_request" do
    assert_difference('PendingFriendRequest.count', -1) do
      delete :destroy, id: @pending_friend_request
    end

    assert_redirected_to pending_friend_requests_path
  end
end
