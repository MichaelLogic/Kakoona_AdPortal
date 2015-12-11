class ProductsController < ApplicationController
  #before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    #logger.debug "Product Config Var Keys: #{@product.config_vars}"

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_attribute
    respond_to do |format|
      format.js
    end
  end

  def go_simple
    @product = Product.new
    respond_to do |format|
      format.js
    end
  end

  def go_digital
    @product = Product.new
    respond_to do |format|
      format.js
    end
  end

  def go_configurable
    @product = Product.new
    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @ad_campaign = current_ad_campaign.find(params[:ad_campaign_id])
    @product = @ad_campaign.product.find(params[:id])

    respond_to do |format|
      if @product.update(product_params)
        flash[:success]= 'Campaign product was successfully updated.'
      else
        flash[:error] = @product.errors.full_messages[0] if @product.errors.count > 0
      end
    end

  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @ad_campaign = current_ad_campaign.find(params[:ad_campaign_id])
    @product = @ad_campaign.product.find(params[:id])

    if @product.destroy
        flash[:success]= 'Campaign Product destroyed'
    else
      flash[:error] = @product.errors.full_messages[0] if @product.errors.count > 0
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:merchant_id, :name, :product_type, :grffk, :cloud_asset_url, :download_url)
    end
end
