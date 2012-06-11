require 'test_helper'

class VariosControllerTest < ActionController::TestCase
  setup do
    @vario = varios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:varios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vario" do
    assert_difference('Vario.count') do
      post :create, vario: @vario.attributes
    end

    assert_redirected_to vario_path(assigns(:vario))
  end

  test "should show vario" do
    get :show, id: @vario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vario
    assert_response :success
  end

  test "should update vario" do
    put :update, id: @vario, vario: @vario.attributes
    assert_redirected_to vario_path(assigns(:vario))
  end

  test "should destroy vario" do
    assert_difference('Vario.count', -1) do
      delete :destroy, id: @vario
    end

    assert_redirected_to varios_path
  end
end
