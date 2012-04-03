require 'test_helper'

class EtiquetaControllerTest < ActionController::TestCase
  setup do
    @etiquetum = etiqueta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:etiqueta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create etiquetum" do
    assert_difference('Etiquetum.count') do
      post :create, :etiquetum => @etiquetum.attributes
    end

    assert_redirected_to etiquetum_path(assigns(:etiquetum))
  end

  test "should show etiquetum" do
    get :show, :id => @etiquetum
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @etiquetum
    assert_response :success
  end

  test "should update etiquetum" do
    put :update, :id => @etiquetum, :etiquetum => @etiquetum.attributes
    assert_redirected_to etiquetum_path(assigns(:etiquetum))
  end

  test "should destroy etiquetum" do
    assert_difference('Etiquetum.count', -1) do
      delete :destroy, :id => @etiquetum
    end

    assert_redirected_to etiqueta_path
  end
end
