require 'test_helper'

class ComponentNutrientsControllerTest < ActionController::TestCase
  setup do
    @component_nutrient = component_nutrients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:component_nutrients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create component_nutrient" do
    assert_difference('ComponentNutrient.count') do
      post :create, component_nutrient: { amount: @component_nutrient.amount, component_id: @component_nutrient.component_id, id: @component_nutrient.id, nutrient_id: @component_nutrient.nutrient_id }
    end

    assert_redirected_to component_nutrient_path(assigns(:component_nutrient))
  end

  test "should show component_nutrient" do
    get :show, id: @component_nutrient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @component_nutrient
    assert_response :success
  end

  test "should update component_nutrient" do
    put :update, id: @component_nutrient, component_nutrient: { amount: @component_nutrient.amount, component_id: @component_nutrient.component_id, id: @component_nutrient.id, nutrient_id: @component_nutrient.nutrient_id }
    assert_redirected_to component_nutrient_path(assigns(:component_nutrient))
  end

  test "should destroy component_nutrient" do
    assert_difference('ComponentNutrient.count', -1) do
      delete :destroy, id: @component_nutrient
    end

    assert_redirected_to component_nutrients_path
  end
end
