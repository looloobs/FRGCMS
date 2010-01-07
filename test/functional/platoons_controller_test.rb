require 'test_helper'

class PlatoonsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:platoons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create platoon" do
    assert_difference('Platoon.count') do
      post :create, :platoon => { }
    end

    assert_redirected_to platoon_path(assigns(:platoon))
  end

  test "should show platoon" do
    get :show, :id => platoons(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => platoons(:one).to_param
    assert_response :success
  end

  test "should update platoon" do
    put :update, :id => platoons(:one).to_param, :platoon => { }
    assert_redirected_to platoon_path(assigns(:platoon))
  end

  test "should destroy platoon" do
    assert_difference('Platoon.count', -1) do
      delete :destroy, :id => platoons(:one).to_param
    end

    assert_redirected_to platoons_path
  end
end
