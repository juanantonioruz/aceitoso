require 'test_helper'

class MediosControllerTest < ActionController::TestCase
  setup do
    @medio = medios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medio" do
    assert_difference('Medio.count') do
      post :create, medio: @medio.attributes
    end

    assert_redirected_to medio_path(assigns(:medio))
  end

  test "should show medio" do
    get :show, id: @medio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medio
    assert_response :success
  end

  test "should update medio" do
    put :update, id: @medio, medio: @medio.attributes
    assert_redirected_to medio_path(assigns(:medio))
  end

  test "should destroy medio" do
    assert_difference('Medio.count', -1) do
      delete :destroy, id: @medio
    end

    assert_redirected_to medios_path
  end
end
