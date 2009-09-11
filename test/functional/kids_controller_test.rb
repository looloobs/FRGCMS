require 'test_helper'

class KidsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kid" do
    assert_difference('Kid.count') do
      post :create, :kid => { }
    end

    assert_redirected_to kid_path(assigns(:kid))
  end

  test "should show kid" do
    get :show, :id => kids(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kids(:one).to_param
    assert_response :success
  end

  test "should update kid" do
    put :update, :id => kids(:one).to_param, :kid => { }
    assert_redirected_to kid_path(assigns(:kid))
  end

  test "should destroy kid" do
    assert_difference('Kid.count', -1) do
      delete :destroy, :id => kids(:one).to_param
    end

    assert_redirected_to kids_path
  end
end
