class AdCampaignsController < ApplicationController
  before_action :set_ad_campaign, only: [:show, :edit, :update, :destroy]

  # GET /ad_campaigns
  # GET /ad_campaigns.json
  def index
    @ad_campaigns = AdCampaign.all
  end

  # GET /ad_campaigns/1
  # GET /ad_campaigns/1.json
  def show
  end

  # GET /ad_campaigns/new
  def new
    @ad_campaign = AdCampaign.new
  end

  # GET /ad_campaigns/1/edit
  def edit
  end

  # POST /ad_campaigns
  # POST /ad_campaigns.json
  def create
    @ad_campaign = AdCampaign.new(ad_campaign_params)

    respond_to do |format|
      if @ad_campaign.save
        format.html { redirect_to @ad_campaign, notice: 'Ad campaign was successfully created.' }
        format.json { render :show, status: :created, location: @ad_campaign }
      else
        format.html { render :new }
        format.json { render json: @ad_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_campaigns/1
  # PATCH/PUT /ad_campaigns/1.json
  def update
    respond_to do |format|
      if @ad_campaign.update(ad_campaign_params)
        format.html { redirect_to @ad_campaign, notice: 'Ad campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad_campaign }
      else
        format.html { render :edit }
        format.json { render json: @ad_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_campaigns/1
  # DELETE /ad_campaigns/1.json
  def destroy
    @ad_campaign.destroy
    respond_to do |format|
      format.html { redirect_to ad_campaigns_url, notice: 'Ad campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_campaign
      @ad_campaign = AdCampaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_campaign_params
      params.require(:ad_campaign).permit(:campaign_title, :start_date, :end_date, :slug, :KakoonaVideos_id, :KakoonaAudio_id, :campaign_main_grffk_id, :CampaignPreloadGrffks_id, :merchant_info_url, :CampaignBrandGrffks_id, :campaign_reach, :campaign_plays, :clickthru, :campaign_price, :Merchants_id)
    end
end
