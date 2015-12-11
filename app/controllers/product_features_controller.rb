class ProductFeaturesController < ApplicationController
  #before_action :set_product_feature, only: [:show, :edit, :update, :destroy]

  # GET /product_features/new
  def new
    @product_feature = ProductFeature.new
  end

  # GET /product_features/1/edit
  def edit
  end

  # POST /product_features
  # POST /product_features.json
  def create
    @product_feature = ProductFeature.new(product_feature_params)

    respond_to do |format|
      if @product_feature.save
        format.html { redirect_to @product_feature, notice: 'Product feature was successfully created.' }
        format.json { render json: @product_feature, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_features/1
  # PATCH/PUT /product_features/1.json
  def update
    respond_to do |format|
      if @product_feature.update(product_feature_params)
        format.html { redirect_to @product_feature, notice: 'Product feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_features/1
  # DELETE /product_features/1.json
  def destroy
    @product_feature.destroy
    respond_to do |format|
      format.html { redirect_to product_features_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_feature
      @product_feature = ProductFeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_feature_params
      params.require(:product_feature).permit(:product_id, :ftr_name, :ftr_detail)
    end
end
