class ContentProvidersController < ApplicationController
  before_action :set_content_provider, only: [:show, :edit, :update, :destroy]

  # GET /content_providers
  # GET /content_providers.json
  def index
    @content_providers = ContentProvider.all
  end

  # GET /content_providers/1
  # GET /content_providers/1.json
  def show
  end

  # GET /content_providers/new
  def new
    @content_provider = ContentProvider.new
  end

  # GET /content_providers/1/edit
  def edit
  end

  # POST /content_providers
  # POST /content_providers.json
  def create
    @content_provider = ContentProvider.new(content_provider_params)

    respond_to do |format|
      if @content_provider.save
        format.html { redirect_to @content_provider, notice: 'Content provider was successfully created.' }
        format.json { render :show, status: :created, location: @content_provider }
      else
        format.html { render :new }
        format.json { render json: @content_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_providers/1
  # PATCH/PUT /content_providers/1.json
  def update
    respond_to do |format|
      if @content_provider.update(content_provider_params)
        format.html { redirect_to @content_provider, notice: 'Content provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_provider }
      else
        format.html { render :edit }
        format.json { render json: @content_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_providers/1
  # DELETE /content_providers/1.json
  def destroy
    @content_provider.destroy
    respond_to do |format|
      format.html { redirect_to content_providers_url, notice: 'Content provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_provider
      @content_provider = ContentProvider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_provider_params
      params.require(:content_provider).permit(:email, :Precious_id, :screen_name, :first_name, :middle_name, :last_name, :phone, :team_role, :rep_about, :is_active, :AvatarGrffks_id, :auth_token, :date_created, :date_modified, :SocialMedia_id, :last_session_time, :last_session_ip, :Sessions_id)
    end
end
