require 'test_helper'

class NatlangsControllerTest < ActionController::TestCase
  setup do
    @natlang = natlangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:natlangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create natlang" do
    assert_difference('Natlang.count') do
      post :create, natlang: { description: @natlang.description, name: @natlang.name }
    end

    assert_redirected_to natlang_path(assigns(:natlang))
  end

  test "should show natlang" do
    get :show, id: @natlang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @natlang
    assert_response :success
  end

  test "should update natlang" do
    patch :update, id: @natlang, natlang: { description: @natlang.description, name: @natlang.name }
    assert_redirected_to natlang_path(assigns(:natlang))
  end

  test "should destroy natlang" do
    assert_difference('Natlang.count', -1) do
      delete :destroy, id: @natlang
    end

    assert_redirected_to natlangs_path
  end
end
