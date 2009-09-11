require 'test_helper'

class AdditionalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:additionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create additional" do
    assert_difference('Additional.count') do
      post :create, :additional => { }
    end

    assert_redirected_to additional_path(assigns(:additional))
  end

  test "should show additional" do
    get :show, :id => additionals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => additionals(:one).to_param
    assert_response :success
  end

  test "should update additional" do
    put :update, :id => additionals(:one).to_param, :additional => { }
    assert_redirected_to additional_path(assigns(:additional))
  end

  test "should destroy additional" do
    assert_difference('Additional.count', -1) do
      delete :destroy, :id => additionals(:one).to_param
    end

    assert_redirected_to additionals_path
  end
end
