require 'test_helper'

class ContentProvidersControllerTest < ActionController::TestCase
  setup do
    @content_provider = content_providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_provider" do
    assert_difference('ContentProvider.count') do
      post :create, content_provider: { AvatarGrffks_id: @content_provider.AvatarGrffks_id, Precious_id: @content_provider.Precious_id, Sessions_id: @content_provider.Sessions_id, SocialMedia_id: @content_provider.SocialMedia_id, auth_token: @content_provider.auth_token, date_created: @content_provider.date_created, date_modified: @content_provider.date_modified, email: @content_provider.email, first_name: @content_provider.first_name, is_active: @content_provider.is_active, last_name: @content_provider.last_name, last_session_ip: @content_provider.last_session_ip, last_session_time: @content_provider.last_session_time, middle_name: @content_provider.middle_name, phone: @content_provider.phone, rep_about: @content_provider.rep_about, screen_name: @content_provider.screen_name, team_role: @content_provider.team_role }
    end

    assert_redirected_to content_provider_path(assigns(:content_provider))
  end

  test "should show content_provider" do
    get :show, id: @content_provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_provider
    assert_response :success
  end

  test "should update content_provider" do
    patch :update, id: @content_provider, content_provider: { AvatarGrffks_id: @content_provider.AvatarGrffks_id, Precious_id: @content_provider.Precious_id, Sessions_id: @content_provider.Sessions_id, SocialMedia_id: @content_provider.SocialMedia_id, auth_token: @content_provider.auth_token, date_created: @content_provider.date_created, date_modified: @content_provider.date_modified, email: @content_provider.email, first_name: @content_provider.first_name, is_active: @content_provider.is_active, last_name: @content_provider.last_name, last_session_ip: @content_provider.last_session_ip, last_session_time: @content_provider.last_session_time, middle_name: @content_provider.middle_name, phone: @content_provider.phone, rep_about: @content_provider.rep_about, screen_name: @content_provider.screen_name, team_role: @content_provider.team_role }
    assert_redirected_to content_provider_path(assigns(:content_provider))
  end

  test "should destroy content_provider" do
    assert_difference('ContentProvider.count', -1) do
      delete :destroy, id: @content_provider
    end

    assert_redirected_to content_providers_path
  end
end
