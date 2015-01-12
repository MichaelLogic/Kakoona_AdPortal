class KakoonaVideo < ActiveRecord::Base
  belongs_to :ad_campaign
  belongs_to :tender_video_thum
end
