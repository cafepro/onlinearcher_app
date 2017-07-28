require 'test_helper'

class ScoreTypesControllerTest < ActionController::TestCase
  setup do
    @score_type = score_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:score_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score_type" do
    assert_difference('ScoreType.count') do
      post :create, score_type: { arrows: @score_type.arrows, distance_1: @score_type.distance_1, distance_2: @score_type.distance_2, distance_3: @score_type.distance_3, distance_4: @score_type.distance_4, name: @score_type.name, published: @score_type.published, score_id: @score_type.score_id }
    end

    assert_redirected_to score_type_path(assigns(:score_type))
  end

  test "should show score_type" do
    get :show, id: @score_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score_type
    assert_response :success
  end

  test "should update score_type" do
    patch :update, id: @score_type, score_type: { arrows: @score_type.arrows, distance_1: @score_type.distance_1, distance_2: @score_type.distance_2, distance_3: @score_type.distance_3, distance_4: @score_type.distance_4, name: @score_type.name, published: @score_type.published, score_id: @score_type.score_id }
    assert_redirected_to score_type_path(assigns(:score_type))
  end

  test "should destroy score_type" do
    assert_difference('ScoreType.count', -1) do
      delete :destroy, id: @score_type
    end

    assert_redirected_to score_types_path
  end
end
