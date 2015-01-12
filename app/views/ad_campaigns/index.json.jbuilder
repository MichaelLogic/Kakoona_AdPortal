json.array!(@ad_campaigns) do |ad_campaign|
  json.extract! ad_campaign, :id, :campaign_title, :start_date, :end_date, :slug, :merchant_info_url, :campaign_reach, :campaign_plays, :clickthru, :campaign_price, :merchant_id
  json.url ad_campaign_url(ad_campaign, format: :json)
end
