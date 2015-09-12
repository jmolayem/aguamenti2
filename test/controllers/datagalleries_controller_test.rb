require 'test_helper'

class DatagalleriesControllerTest < ActionController::TestCase
  setup do
    @datagallery = datagalleries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datagalleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datagallery" do
    assert_difference('Datagallery.count') do
      post :create, datagallery: { name: @datagallery.name, organization: @datagallery.organization, size: @datagallery.size }
    end

    assert_redirected_to datagallery_path(assigns(:datagallery))
  end

  test "should show datagallery" do
    get :show, id: @datagallery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @datagallery
    assert_response :success
  end

  test "should update datagallery" do
    patch :update, id: @datagallery, datagallery: { name: @datagallery.name, organization: @datagallery.organization, size: @datagallery.size }
    assert_redirected_to datagallery_path(assigns(:datagallery))
  end

  test "should destroy datagallery" do
    assert_difference('Datagallery.count', -1) do
      delete :destroy, id: @datagallery
    end

    assert_redirected_to datagalleries_path
  end
end
