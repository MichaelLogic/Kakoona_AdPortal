class KakoonaVideosController < ApplicationController
  #before_action :set_kakoona_video, only: [:show, :edit, :update, :destroy]

  # POST /kakoona_videos
  # POST /kakoona_videos.json
  def create
    @kakoona_video = KakoonaVideo.new(kakoona_video_params)

    respond_to do |format|
      if @kakoona_video.save
        flash[:success]= 'Kakoona video was successfully created.'
      else
        flash.now[:notice] = 'Error Occurred'
      end
    end
  end

  # PATCH/PUT /kakoona_videos/1
  # PATCH/PUT /kakoona_videos/1.json
  def update
    @ad_campaign = current_ad_campaign.find(params[:ad_campaign_id])
    @video = @ad_campaign.kakoona_video.find(params[:id])

    respond_to do |format|
      if @video.update(campaign_preload_grffk_params)
        flash[:success]= 'Kakoona Video was successfully updated.'
      else
        flash[:error] = @video.errors.full_messages[0] if @video.errors.count > 0
      end
    end
  end

  # DELETE /kakoona_videos/1
  # DELETE /kakoona_videos/1.json
  def destroy
    @ad_campaign = current_ad_campaign.find(params[:ad_campaign_id])
    @video = @ad_campaign.kakoona_video.find(params[:id])

    if @video.destroy
        flash[:success]= 'Kakoona Video destroyed'
    else
      flash[:error] = @video.errors.full_messages[0] if @video.errors.count > 0
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kakoona_video
      @kakoona_video = KakoonaVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kakoona_video_params
      params.require(:kakoona_video).permit(:ad_campaign_id, :movie, :length, :title, :description, :movie_views, :cloud_asset_url, :selected_thum )
    end
end
