require 'test_helper'

class ChildrensControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:childrens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create children" do
    assert_difference('Children.count') do
      post :create, :children => { }
    end

    assert_redirected_to children_path(assigns(:children))
  end

  test "should show children" do
    get :show, :id => childrens(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => childrens(:one).to_param
    assert_response :success
  end

  test "should update children" do
    put :update, :id => childrens(:one).to_param, :children => { }
    assert_redirected_to children_path(assigns(:children))
  end

  test "should destroy children" do
    assert_difference('Children.count', -1) do
      delete :destroy, :id => childrens(:one).to_param
    end

    assert_redirected_to childrens_path
  end
end
