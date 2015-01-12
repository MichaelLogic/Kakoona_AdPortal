json.array!(@campaign_preload_grffks) do |campaign_preload_grffk|
  json.extract! campaign_preload_grffk, :id, :ad_campaign_id, :raw_file_name, :meta_description, :file_type, :grffk_url
  json.url campaign_preload_grffk_url(campaign_preload_grffk, format: :json)
end
