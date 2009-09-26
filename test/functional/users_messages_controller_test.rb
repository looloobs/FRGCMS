require 'test_helper'

class UsersMessagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_messages" do
    assert_difference('UsersMessages.count') do
      post :create, :users_messages => { }
    end

    assert_redirected_to users_messages_path(assigns(:users_messages))
  end

  test "should show users_messages" do
    get :show, :id => users_messages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users_messages(:one).to_param
    assert_response :success
  end

  test "should update users_messages" do
    put :update, :id => users_messages(:one).to_param, :users_messages => { }
    assert_redirected_to users_messages_path(assigns(:users_messages))
  end

  test "should destroy users_messages" do
    assert_difference('UsersMessages.count', -1) do
      delete :destroy, :id => users_messages(:one).to_param
    end

    assert_redirected_to users_messages_path
  end
end
