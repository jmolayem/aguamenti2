require 'test_helper'

class ConvnetsControllerTest < ActionController::TestCase
  setup do
    @convnet = convnets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:convnets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convnet" do
    assert_difference('Convnet.count') do
      post :create, convnet: { api: @convnet.api, description: @convnet.description, image: @convnet.image, modelid: @convnet.modelid, name: @convnet.name }
    end

    assert_redirected_to convnet_path(assigns(:convnet))
  end

  test "should show convnet" do
    get :show, id: @convnet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @convnet
    assert_response :success
  end

  test "should update convnet" do
    patch :update, id: @convnet, convnet: { api: @convnet.api, description: @convnet.description, image: @convnet.image, modelid: @convnet.modelid, name: @convnet.name }
    assert_redirected_to convnet_path(assigns(:convnet))
  end

  test "should destroy convnet" do
    assert_difference('Convnet.count', -1) do
      delete :destroy, id: @convnet
    end

    assert_redirected_to convnets_path
  end
end
