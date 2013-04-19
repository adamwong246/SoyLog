require 'test_helper'

class BodyProfileNutrientsControllerTest < ActionController::TestCase
  setup do
    @body_profile_nutrient = body_profile_nutrients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:body_profile_nutrients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create body_profile_nutrient" do
    assert_difference('BodyProfileNutrient.count') do
      post :create, body_profile_nutrient: { body_profile_id: @body_profile_nutrient.body_profile_id, daily_requirement: @body_profile_nutrient.daily_requirement, id: @body_profile_nutrient.id, nutrient_id: @body_profile_nutrient.nutrient_id }
    end

    assert_redirected_to body_profile_nutrient_path(assigns(:body_profile_nutrient))
  end

  test "should show body_profile_nutrient" do
    get :show, id: @body_profile_nutrient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @body_profile_nutrient
    assert_response :success
  end

  test "should update body_profile_nutrient" do
    put :update, id: @body_profile_nutrient, body_profile_nutrient: { body_profile_id: @body_profile_nutrient.body_profile_id, daily_requirement: @body_profile_nutrient.daily_requirement, id: @body_profile_nutrient.id, nutrient_id: @body_profile_nutrient.nutrient_id }
    assert_redirected_to body_profile_nutrient_path(assigns(:body_profile_nutrient))
  end

  test "should destroy body_profile_nutrient" do
    assert_difference('BodyProfileNutrient.count', -1) do
      delete :destroy, id: @body_profile_nutrient
    end

    assert_redirected_to body_profile_nutrients_path
  end
end
