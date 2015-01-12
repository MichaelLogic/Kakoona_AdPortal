class CampaignBrandGrffksController < ApplicationController
  before_action :set_campaign_brand_grffk, only: [:show, :edit, :update, :destroy]

  # GET /campaign_brand_grffks
  # GET /campaign_brand_grffks.json
  def index
    @campaign_brand_grffks = CampaignBrandGrffk.all
  end

  # GET /campaign_brand_grffks/1
  # GET /campaign_brand_grffks/1.json
  def show
  end

  # GET /campaign_brand_grffks/new
  def new
    @campaign_brand_grffk = CampaignBrandGrffk.new
  end

  # GET /campaign_brand_grffks/1/edit
  def edit
  end

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
    respond_to do |format|
      if @campaign_brand_grffk.update(campaign_brand_grffk_params)
        format.html { redirect_to @campaign_brand_grffk, notice: 'Campaign brand grffk was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign_brand_grffk }
      else
        format.html { render :edit }
        format.json { render json: @campaign_brand_grffk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_brand_grffks/1
  # DELETE /campaign_brand_grffks/1.json
  def destroy
    @campaign_brand_grffk.destroy
    respond_to do |format|
      format.html { redirect_to campaign_brand_grffks_url, notice: 'Campaign brand grffk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_brand_grffk
      @campaign_brand_grffk = CampaignBrandGrffk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_brand_grffk_params
      params.require(:campaign_brand_grffk).permit(:ad_campaign_id, :raw_file_name, :meta_description, :file_type, :grffk_url)
    end
end
