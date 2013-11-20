require 'test_helper'

class UserFriendRelationsControllerTest < ActionController::TestCase
  setup do
    @user_friend_relation = user_friend_relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_friend_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_friend_relation" do
    assert_difference('UserFriendRelation.count') do
      post :create, user_friend_relation: { user_id1: @user_friend_relation.user_id1, user_id2: @user_friend_relation.user_id2 }
    end

    assert_redirected_to user_friend_relation_path(assigns(:user_friend_relation))
  end

  test "should show user_friend_relation" do
    get :show, id: @user_friend_relation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_friend_relation
    assert_response :success
  end

  test "should update user_friend_relation" do
    patch :update, id: @user_friend_relation, user_friend_relation: { user_id1: @user_friend_relation.user_id1, user_id2: @user_friend_relation.user_id2 }
    assert_redirected_to user_friend_relation_path(assigns(:user_friend_relation))
  end

  test "should destroy user_friend_relation" do
    assert_difference('UserFriendRelation.count', -1) do
      delete :destroy, id: @user_friend_relation
    end

    assert_redirected_to user_friend_relations_path
  end
end
