require 'test_helper'

class AdCampaignsControllerTest < ActionController::TestCase
  setup do
    @ad_campaign = ad_campaigns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_campaigns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_campaign" do
    assert_difference('AdCampaign.count') do
      post :create, ad_campaign: { CampaignBrandGrffks_id: @ad_campaign.CampaignBrandGrffks_id, CampaignPreloadGrffks_id: @ad_campaign.CampaignPreloadGrffks_id, KakoonaAudio_id: @ad_campaign.KakoonaAudio_id, KakoonaVideos_id: @ad_campaign.KakoonaVideos_id, Merchants_id: @ad_campaign.Merchants_id, campaign_main_grffk_id: @ad_campaign.campaign_main_grffk_id, campaign_plays: @ad_campaign.campaign_plays, campaign_price: @ad_campaign.campaign_price, campaign_reach: @ad_campaign.campaign_reach, campaign_title: @ad_campaign.campaign_title, clickthru: @ad_campaign.clickthru, end_date: @ad_campaign.end_date, merchant_info_url: @ad_campaign.merchant_info_url, slug: @ad_campaign.slug, start_date: @ad_campaign.start_date }
    end

    assert_redirected_to ad_campaign_path(assigns(:ad_campaign))
  end

  test "should show ad_campaign" do
    get :show, id: @ad_campaign
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_campaign
    assert_response :success
  end

  test "should update ad_campaign" do
    patch :update, id: @ad_campaign, ad_campaign: { CampaignBrandGrffks_id: @ad_campaign.CampaignBrandGrffks_id, CampaignPreloadGrffks_id: @ad_campaign.CampaignPreloadGrffks_id, KakoonaAudio_id: @ad_campaign.KakoonaAudio_id, KakoonaVideos_id: @ad_campaign.KakoonaVideos_id, Merchants_id: @ad_campaign.Merchants_id, campaign_main_grffk_id: @ad_campaign.campaign_main_grffk_id, campaign_plays: @ad_campaign.campaign_plays, campaign_price: @ad_campaign.campaign_price, campaign_reach: @ad_campaign.campaign_reach, campaign_title: @ad_campaign.campaign_title, clickthru: @ad_campaign.clickthru, end_date: @ad_campaign.end_date, merchant_info_url: @ad_campaign.merchant_info_url, slug: @ad_campaign.slug, start_date: @ad_campaign.start_date }
    assert_redirected_to ad_campaign_path(assigns(:ad_campaign))
  end

  test "should destroy ad_campaign" do
    assert_difference('AdCampaign.count', -1) do
      delete :destroy, id: @ad_campaign
    end

    assert_redirected_to ad_campaigns_path
  end
end
