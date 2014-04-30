require 'test_helper'

class PatentnosControllerTest < ActionController::TestCase
  setup do
    @patentno = patentnos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patentnos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patentno" do
    assert_difference('Patentno.count') do
      post :create, patentno: { patno: @patentno.patno }
    end

    assert_redirected_to patentno_path(assigns(:patentno))
  end

  test "should show patentno" do
    get :show, id: @patentno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patentno
    assert_response :success
  end

  test "should update patentno" do
    patch :update, id: @patentno, patentno: { patno: @patentno.patno }
    assert_redirected_to patentno_path(assigns(:patentno))
  end

  test "should destroy patentno" do
    assert_difference('Patentno.count', -1) do
      delete :destroy, id: @patentno
    end

    assert_redirected_to patentnos_path
  end
end
