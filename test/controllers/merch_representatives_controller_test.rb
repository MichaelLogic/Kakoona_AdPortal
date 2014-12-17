require 'test_helper'

class MerchRepresentativesControllerTest < ActionController::TestCase
  setup do
    @merch_representative = merch_representatives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merch_representatives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merch_representative" do
    assert_difference('MerchRepresentative.count') do
      post :create, merch_representative: { AvatarGrffks_id: @merch_representative.AvatarGrffks_id, Merchants_id: @merch_representative.Merchants_id, Precious_id: @merch_representative.Precious_id, Sessions_id: @merch_representative.Sessions_id, SocialMedia_id: @merch_representative.SocialMedia_id, auth_token: @merch_representative.auth_token, date_created: @merch_representative.date_created, date_modified: @merch_representative.date_modified, email: @merch_representative.email, first_name: @merch_representative.first_name, is_active: @merch_representative.is_active, last_name: @merch_representative.last_name, last_session_ip: @merch_representative.last_session_ip, last_session_time: @merch_representative.last_session_time, middle_name: @merch_representative.middle_name, phone: @merch_representative.phone, rep_about: @merch_representative.rep_about, screen_name: @merch_representative.screen_name, team_role: @merch_representative.team_role }
    end

    assert_redirected_to merch_representative_path(assigns(:merch_representative))
  end

  test "should show merch_representative" do
    get :show, id: @merch_representative
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merch_representative
    assert_response :success
  end

  test "should update merch_representative" do
    patch :update, id: @merch_representative, merch_representative: { AvatarGrffks_id: @merch_representative.AvatarGrffks_id, Merchants_id: @merch_representative.Merchants_id, Precious_id: @merch_representative.Precious_id, Sessions_id: @merch_representative.Sessions_id, SocialMedia_id: @merch_representative.SocialMedia_id, auth_token: @merch_representative.auth_token, date_created: @merch_representative.date_created, date_modified: @merch_representative.date_modified, email: @merch_representative.email, first_name: @merch_representative.first_name, is_active: @merch_representative.is_active, last_name: @merch_representative.last_name, last_session_ip: @merch_representative.last_session_ip, last_session_time: @merch_representative.last_session_time, middle_name: @merch_representative.middle_name, phone: @merch_representative.phone, rep_about: @merch_representative.rep_about, screen_name: @merch_representative.screen_name, team_role: @merch_representative.team_role }
    assert_redirected_to merch_representative_path(assigns(:merch_representative))
  end

  test "should destroy merch_representative" do
    assert_difference('MerchRepresentative.count', -1) do
      delete :destroy, id: @merch_representative
    end

    assert_redirected_to merch_representatives_path
  end
end
