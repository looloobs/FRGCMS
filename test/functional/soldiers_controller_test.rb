require 'test_helper'

class SoldiersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soldiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soldier" do
    assert_difference('Soldier.count') do
      post :create, :soldier => { }
    end

    assert_redirected_to soldier_path(assigns(:soldier))
  end

  test "should show soldier" do
    get :show, :id => soldiers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => soldiers(:one).to_param
    assert_response :success
  end

  test "should update soldier" do
    put :update, :id => soldiers(:one).to_param, :soldier => { }
    assert_redirected_to soldier_path(assigns(:soldier))
  end

  test "should destroy soldier" do
    assert_difference('Soldier.count', -1) do
      delete :destroy, :id => soldiers(:one).to_param
    end

    assert_redirected_to soldiers_path
  end
end
