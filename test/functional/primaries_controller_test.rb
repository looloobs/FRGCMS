require 'test_helper'

class PrimariesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primary" do
    assert_difference('Primary.count') do
      post :create, :primary => { }
    end

    assert_redirected_to primary_path(assigns(:primary))
  end

  test "should show primary" do
    get :show, :id => primaries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => primaries(:one).to_param
    assert_response :success
  end

  test "should update primary" do
    put :update, :id => primaries(:one).to_param, :primary => { }
    assert_redirected_to primary_path(assigns(:primary))
  end

  test "should destroy primary" do
    assert_difference('Primary.count', -1) do
      delete :destroy, :id => primaries(:one).to_param
    end

    assert_redirected_to primaries_path
  end
end
