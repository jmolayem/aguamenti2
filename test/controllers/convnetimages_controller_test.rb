require 'test_helper'

class ConvnetimagesControllerTest < ActionController::TestCase
  setup do
    @convnetimage = convnetimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:convnetimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convnetimage" do
    assert_difference('Convnetimage.count') do
      post :create, convnetimage: { api: @convnetimage.api, description: @convnetimage.description, modelid: @convnetimage.modelid, name: @convnetimage.name }
    end

    assert_redirected_to convnetimage_path(assigns(:convnetimage))
  end

  test "should show convnetimage" do
    get :show, id: @convnetimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @convnetimage
    assert_response :success
  end

  test "should update convnetimage" do
    patch :update, id: @convnetimage, convnetimage: { api: @convnetimage.api, description: @convnetimage.description, modelid: @convnetimage.modelid, name: @convnetimage.name }
    assert_redirected_to convnetimage_path(assigns(:convnetimage))
  end

  test "should destroy convnetimage" do
    assert_difference('Convnetimage.count', -1) do
      delete :destroy, id: @convnetimage
    end

    assert_redirected_to convnetimages_path
  end
end
