require 'test_helper'

class ScrapeparamsControllerTest < ActionController::TestCase
  setup do
    @scrapeparam = scrapeparams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrapeparams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrapeparam" do
    assert_difference('Scrapeparam.count') do
      post :create, scrapeparam: { pages: @scrapeparam.pages, url: @scrapeparam.url }
    end

    assert_redirected_to scrapeparam_path(assigns(:scrapeparam))
  end

  test "should show scrapeparam" do
    get :show, id: @scrapeparam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrapeparam
    assert_response :success
  end

  test "should update scrapeparam" do
    patch :update, id: @scrapeparam, scrapeparam: { pages: @scrapeparam.pages, url: @scrapeparam.url }
    assert_redirected_to scrapeparam_path(assigns(:scrapeparam))
  end

  test "should destroy scrapeparam" do
    assert_difference('Scrapeparam.count', -1) do
      delete :destroy, id: @scrapeparam
    end

    assert_redirected_to scrapeparams_path
  end
end
