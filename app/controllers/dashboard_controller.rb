class DashboardController < ApplicationController
  before_action :signed_in_user

  def home
  	#@ad_campaigns = AdCampaign.where(merch_representative_id: current_user.id)
	#@ad_campaigns.each do |ad_campaign|
	  #logger.debug "Video Title: #{ad_campaign.vid.title}"
	#end
	@ad_campaigns = current_user.ad_campaigns
  	logger.debug "AD CAMPAIGN COUNT: #{@ad_campaigns.count}"
  
  end

  def about
  end

  def future
  end

  def contact
  end


end
