require 'test_helper'

class BattalionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battalions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battalion" do
    assert_difference('Battalion.count') do
      post :create, :battalion => { }
    end

    assert_redirected_to battalion_path(assigns(:battalion))
  end

  test "should show battalion" do
    get :show, :id => battalions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => battalions(:one).to_param
    assert_response :success
  end

  test "should update battalion" do
    put :update, :id => battalions(:one).to_param, :battalion => { }
    assert_redirected_to battalion_path(assigns(:battalion))
  end

  test "should destroy battalion" do
    assert_difference('Battalion.count', -1) do
      delete :destroy, :id => battalions(:one).to_param
    end

    assert_redirected_to battalions_path
  end
end
