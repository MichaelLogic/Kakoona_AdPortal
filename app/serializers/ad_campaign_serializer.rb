class AdCampaignSerializer < ActiveModel::Serializer
 
  attributes :id, :campaign_title, :start_date, :end_date, :slug, :merchant_info_url

  has_one :campaign_brand_grffk
  has_one :campaign_preload_grffk
  has_one :product
  has_one :kakoona_video
  
end
