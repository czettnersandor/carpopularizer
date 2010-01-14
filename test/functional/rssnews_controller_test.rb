require 'test_helper'

class RssnewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rssnews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rssnew" do
    assert_difference('Rssnew.count') do
      post :create, :rssnew => { }
    end

    assert_redirected_to rssnew_path(assigns(:rssnew))
  end

  test "should show rssnew" do
    get :show, :id => rssnews(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rssnews(:one).to_param
    assert_response :success
  end

  test "should update rssnew" do
    put :update, :id => rssnews(:one).to_param, :rssnew => { }
    assert_redirected_to rssnew_path(assigns(:rssnew))
  end

  test "should destroy rssnew" do
    assert_difference('Rssnew.count', -1) do
      delete :destroy, :id => rssnews(:one).to_param
    end

    assert_redirected_to rssnews_path
  end
end
