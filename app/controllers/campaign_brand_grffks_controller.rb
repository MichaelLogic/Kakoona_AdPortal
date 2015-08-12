class CampaignBrandGrffksController < ApplicationController
  #before_action :set_campaign_brand_grffk, only: [:show, :edit, :update, :destroy]

  # POST /campaign_brand_grffks
  # POST /campaign_brand_grffks.json
  def create
    @campaign_brand_grffk = CampaignBrandGrffk.new(campaign_brand_grffk_params)

    respond_to do |format|
      if @campaign_brand_grffk.save
        format.html { redirect_to @campaign_brand_grffk, notice: 'Campaign brand grffk was successfully created.' }
        format.json { render :show, status: :created, location: @campaign_brand_grffk }
      else
        format.html { render :new }
        format.json { render json: @campaign_brand_grffk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_brand_grffks/1
  # PATCH/PUT /campaign_brand_grffks/1.json
  def update
    @ad_campaign = current_ad_campaign.find(params[:ad_campaign_id])
    @brand_grffk = @ad_campaign.campaign_brand_grffk.find(params[:id])

    respond_to do |format|
      if @brand_grffk.update(campaign_brand_grffk_params)
        flash[:success]= 'Campaign brand grffk was successfully updated.'
      else
        flash[:error] = @brand_grffk.errors.full_messages[0] if @brand_grffk.errors.count > 0
      end
    end
  end

  # DELETE /campaign_brand_grffks/1
  # DELETE /campaign_brand_grffks/1.json
  def destroy
    @ad_campaign = current_ad_campaign.find(params[:ad_campaign_id])
    @brand_grffk = @ad_campaign.campaign_brand_grffk.find(params[:id])

    if @brand_grffk.destroy
        flash[:success]= 'Campaign Brand Graphic destroyed'
    else
      flash[:error] = @brand_grffk.errors.full_messages[0] if @brand_grffk.errors.count > 0
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_brand_grffk
      @campaign_brand_grffk = CampaignBrandGrffk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_brand_grffk_params
      params.require(:campaign_brand_grffk).permit(:ad_campaign_id, :grffk, :cloud_asset_url )
    end
end
