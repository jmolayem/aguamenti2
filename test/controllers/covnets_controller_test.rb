require 'test_helper'

class CovnetsControllerTest < ActionController::TestCase
  setup do
    @covnet = covnets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:covnets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create covnet" do
    assert_difference('Covnet.count') do
      post :create, covnet: { api: @covnet.api, description: @covnet.description, image: @covnet.image, modelid: @covnet.modelid, name: @covnet.name }
    end

    assert_redirected_to covnet_path(assigns(:covnet))
  end

  test "should show covnet" do
    get :show, id: @covnet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @covnet
    assert_response :success
  end

  test "should update covnet" do
    patch :update, id: @covnet, covnet: { api: @covnet.api, description: @covnet.description, image: @covnet.image, modelid: @covnet.modelid, name: @covnet.name }
    assert_redirected_to covnet_path(assigns(:covnet))
  end

  test "should destroy covnet" do
    assert_difference('Covnet.count', -1) do
      delete :destroy, id: @covnet
    end

    assert_redirected_to covnets_path
  end
end
