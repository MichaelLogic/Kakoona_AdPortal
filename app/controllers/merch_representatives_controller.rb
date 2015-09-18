class MerchRepresentativesController < ApplicationController
  before_action :set_merch_representative, only: [:show, :edit, :update, :destroy]

  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  # GET /merch_representatives
  # GET /merch_representatives.json
  def index
    @merch_representatives = MerchRepresentative.all
  end

  # GET /merch_representatives/1
  # GET /merch_representatives/1.json
  def show
    #@merch_representative.build_avatar_grffk
  end

  # GET /merch_representatives/new
  def new
    @merch_representative = MerchRepresentative.new
    @merch_representative.build_avatar_grffk
  end

  # GET /merch_representatives/1/edit
  def edit
  end

  # POST /merch_representatives
  # POST /merch_representatives.json
  def create
    @merch_representative = MerchRepresentative.new(merch_representative_params)

    respond_to do |format|
      if @merch_representative.save

        format.html { redirect_to login_path, notice: 'Merch representative was successfully created.  Now Sign in!' }
        format.json { render :show, status: :created, location: @merch_representative }
      else
        format.html { render :new }
        format.json { render json: @merch_representative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merch_representatives/1
  # PATCH/PUT /merch_representatives/1.json
  def update
    respond_to do |format|
      if @merch_representative.update(merch_representative_params)
        format.html { redirect_to @merch_representative, notice: 'Merch representative was successfully updated.' }
        format.json { render :show, status: :ok, location: @merch_representative }
      else
        format.html { render :edit }
        format.json { render json: @merch_representative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merch_representatives/1
  # DELETE /merch_representatives/1.json
  def destroy
    @merch_representative.destroy
    respond_to do |format|
      format.html { redirect_to merch_representatives_url, notice: 'Merch representative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_merch_representative
      @merch_representative = MerchRepresentative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merch_representative_params
      params.require(:merch_representative).permit(:merchant_id, :email, :screen_name, :first_name, :middle_name, :last_name, :phone, :team_role, :rep_about, :is_active, :auth_token, :last_session_time, :last_session_ip, :password, :password_confirmation, :admin, avatar_grffk_attributes: [ :id, :grffk, :cloud_asset_url ])
    end

    def correct_user
      @merch_representative = MerchRepresentative.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      @merch_representative = MerchRepresentative.find(session[:merch_representative_id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end

end
