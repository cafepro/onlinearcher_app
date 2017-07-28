require 'test_helper'

class ArrowsControllerTest < ActionController::TestCase
  setup do
    @arrow = arrows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arrows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arrow" do
    assert_difference('Arrow.count') do
      post :create, arrow: { score_id: @arrow.score_id, value: @arrow.value }
    end

    assert_redirected_to arrow_path(assigns(:arrow))
  end

  test "should show arrow" do
    get :show, id: @arrow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arrow
    assert_response :success
  end

  test "should update arrow" do
    patch :update, id: @arrow, arrow: { score_id: @arrow.score_id, value: @arrow.value }
    assert_redirected_to arrow_path(assigns(:arrow))
  end

  test "should destroy arrow" do
    assert_difference('Arrow.count', -1) do
      delete :destroy, id: @arrow
    end

    assert_redirected_to arrows_path
  end
end
