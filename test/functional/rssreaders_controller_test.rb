require 'test_helper'

class RssreadersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rssreaders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rssreader" do
    assert_difference('Rssreader.count') do
      post :create, :rssreader => { }
    end

    assert_redirected_to rssreader_path(assigns(:rssreader))
  end

  test "should show rssreader" do
    get :show, :id => rssreaders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rssreaders(:one).to_param
    assert_response :success
  end

  test "should update rssreader" do
    put :update, :id => rssreaders(:one).to_param, :rssreader => { }
    assert_redirected_to rssreader_path(assigns(:rssreader))
  end

  test "should destroy rssreader" do
    assert_difference('Rssreader.count', -1) do
      delete :destroy, :id => rssreaders(:one).to_param
    end

    assert_redirected_to rssreaders_path
  end
end
