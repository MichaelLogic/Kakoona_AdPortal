class AdCampaign < ActiveRecord::Base
  belongs_to :KakoonaVideos
  belongs_to :KakoonaAudio
  belongs_to :campaign_main_grffk
  belongs_to :CampaignPreloadGrffks
  belongs_to :CampaignBrandGrffks
  belongs_to :Merchants
end
