class KakoonaVideosController < ApplicationController
  before_action :set_kakoona_video, only: [:show, :edit, :update, :destroy]

  # GET /kakoona_videos
  # GET /kakoona_videos.json
  def index
    @kakoona_videos = KakoonaVideo.all
  end

  # GET /kakoona_videos/1
  # GET /kakoona_videos/1.json
  def show
  end

  # GET /kakoona_videos/new
  def new
    @kakoona_video = KakoonaVideo.new
  end

  # GET /kakoona_videos/1/edit
  def edit
  end

  # POST /kakoona_videos
  # POST /kakoona_videos.json
  def create
    @kakoona_video = KakoonaVideo.new(kakoona_video_params)

    respond_to do |format|
      if @kakoona_video.save
        format.html { redirect_to @kakoona_video, notice: 'Kakoona video was successfully created.' }
        format.json { render :show, status: :created, location: @kakoona_video }
      else
        format.html { render :new }
        format.json { render json: @kakoona_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kakoona_videos/1
  # PATCH/PUT /kakoona_videos/1.json
  def update
    respond_to do |format|
      if @kakoona_video.update(kakoona_video_params)
        format.html { redirect_to @kakoona_video, notice: 'Kakoona video was successfully updated.' }
        format.json { render :show, status: :ok, location: @kakoona_video }
      else
        format.html { render :edit }
        format.json { render json: @kakoona_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kakoona_videos/1
  # DELETE /kakoona_videos/1.json
  def destroy
    @kakoona_video.destroy
    respond_to do |format|
      format.html { redirect_to kakoona_videos_url, notice: 'Kakoona video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kakoona_video
      @kakoona_video = KakoonaVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kakoona_video_params
      params.require(:kakoona_video).permit(:ad_campaign_id, :duration, :raw_file_name, :format_type, :file_size, :vid_views, :vid_url, :genre, :vid_description, :meta_tags, :tender_video_thum_id)
    end
end
