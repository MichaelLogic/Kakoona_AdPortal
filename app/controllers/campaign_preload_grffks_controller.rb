class CampaignPreloadGrffksController < ApplicationController
  before_action :set_campaign_preload_grffk, only: [:show, :edit, :update, :destroy]

  # GET /campaign_preload_grffks
  # GET /campaign_preload_grffks.json
  def index
    @campaign_preload_grffks = CampaignPreloadGrffk.all
  end

  # GET /campaign_preload_grffks/1
  # GET /campaign_preload_grffks/1.json
  def show
  end

  # GET /campaign_preload_grffks/new
  def new
    @campaign_preload_grffk = CampaignPreloadGrffk.new
  end

  # GET /campaign_preload_grffks/1/edit
  def edit
  end

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
    respond_to do |format|
      if @campaign_preload_grffk.update(campaign_preload_grffk_params)
        format.html { redirect_to @campaign_preload_grffk, notice: 'Campaign preload grffk was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign_preload_grffk }
      else
        format.html { render :edit }
        format.json { render json: @campaign_preload_grffk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_preload_grffks/1
  # DELETE /campaign_preload_grffks/1.json
  def destroy
    @campaign_preload_grffk.destroy
    respond_to do |format|
      format.html { redirect_to campaign_preload_grffks_url, notice: 'Campaign preload grffk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_preload_grffk
      @campaign_preload_grffk = CampaignPreloadGrffk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_preload_grffk_params
      params.require(:campaign_preload_grffk).permit(:ad_campaign_id, :raw_file_name, :meta_description, :file_type, :grffk_url)
    end
end
