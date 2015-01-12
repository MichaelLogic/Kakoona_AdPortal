json.array!(@campaign_brand_grffks) do |campaign_brand_grffk|
  json.extract! campaign_brand_grffk, :id, :ad_campaign_id, :raw_file_name, :meta_description, :file_type, :grffk_url
  json.url campaign_brand_grffk_url(campaign_brand_grffk, format: :json)
end
