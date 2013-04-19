require 'test_helper'

class BodyProfilesControllerTest < ActionController::TestCase
  setup do
    @body_profile = body_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:body_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create body_profile" do
    assert_difference('BodyProfile.count') do
      post :create, body_profile: { id: @body_profile.id, name: @body_profile.name }
    end

    assert_redirected_to body_profile_path(assigns(:body_profile))
  end

  test "should show body_profile" do
    get :show, id: @body_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @body_profile
    assert_response :success
  end

  test "should update body_profile" do
    put :update, id: @body_profile, body_profile: { id: @body_profile.id, name: @body_profile.name }
    assert_redirected_to body_profile_path(assigns(:body_profile))
  end

  test "should destroy body_profile" do
    assert_difference('BodyProfile.count', -1) do
      delete :destroy, id: @body_profile
    end

    assert_redirected_to body_profiles_path
  end
end
