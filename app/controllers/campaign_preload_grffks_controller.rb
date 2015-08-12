class CampaignPreloadGrffksController < ApplicationController
  #before_action :set_campaign_preload_grffk, only: [:show, :edit, :update, :destroy]

  # POST /campaign_preload_grffks
  # POST /campaign_preload_grffks.json
  def create
    @campaign_preload_grffk = CampaignPreloadGrffk.new(campaign_preload_grffk_params)

    respond_to do |format|
      if @campaign_preload_grffk.save
        format.html { redirect_to @campaign_preload_grffk, notice: 'Campaign preload grffk was successfully created.' }
        format.json { render :show, status: :created, location: @campaign_preload_grffk }
      else
        format.html { render :new }
        format.json { render json: @campaign_preload_grffk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_preload_grffks/1
  # PATCH/PUT /campaign_preload_grffks/1.json
  def update
    @ad_campaign = current_ad_campaign.find(params[:ad_campaign_id])
    @preload_grffk = @ad_campaign.preload_brand_grffk.find(params[:id])

    respond_to do |format|
      if @preload_grffk.update(campaign_preload_grffk_params)
        flash[:success]= 'Campaign brand grffk was successfully updated.'
      else
        flash[:error] = @preload_grffk.errors.full_messages[0] if @preload_grffk.errors.count > 0
      end
    end
  end

  # DELETE /campaign_preload_grffks/1
  # DELETE /campaign_preload_grffks/1.json
  def destroy
    @ad_campaign = current_ad_campaign.find(params[:ad_campaign_id])
    @preload_grffk = @ad_campaign.campaign_preload_grffk.find(params[:id])

    if @preload_grffk.destroy
        flash[:success]= 'Campaign Preload Graphic destroyed'
    else
      flash[:error] = @preload_grffk.errors.full_messages[0] if @preload_grffk.errors.count > 0
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_preload_grffk
      @campaign_preload_grffk = CampaignPreloadGrffk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_preload_grffk_params
      params.require(:campaign_preload_grffk).permit(:ad_campaign_id, :grffk, :cloud_asset_url )
    end
end
