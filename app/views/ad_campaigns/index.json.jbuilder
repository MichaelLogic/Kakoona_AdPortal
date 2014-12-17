json.array!(@ad_campaigns) do |ad_campaign|
  json.extract! ad_campaign, :id, :campaign_title, :start_date, :end_date, :slug, :KakoonaVideos_id, :KakoonaAudio_id, :campaign_main_grffk_id, :CampaignPreloadGrffks_id, :merchant_info_url, :CampaignBrandGrffks_id, :campaign_reach, :campaign_plays, :clickthru, :campaign_price, :Merchants_id
  json.url ad_campaign_url(ad_campaign, format: :json)
end
