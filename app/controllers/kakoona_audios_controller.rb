class KakoonaAudiosController < ApplicationController
  before_action :set_kakoona_audio, only: [:show, :edit, :update, :destroy]

  # GET /kakoona_audios
  # GET /kakoona_audios.json
  def index
    @kakoona_audios = KakoonaAudio.all
  end

  # GET /kakoona_audios/1
  # GET /kakoona_audios/1.json
  def show
  end

  # GET /kakoona_audios/new
  def new
    @kakoona_audio = KakoonaAudio.new
  end

  # GET /kakoona_audios/1/edit
  def edit
  end

  # POST /kakoona_audios
  # POST /kakoona_audios.json
  def create
    @kakoona_audio = KakoonaAudio.new(kakoona_audio_params)

    respond_to do |format|
      if @kakoona_audio.save
        format.html { redirect_to @kakoona_audio, notice: 'Kakoona audio was successfully created.' }
        format.json { render :show, status: :created, location: @kakoona_audio }
      else
        format.html { render :new }
        format.json { render json: @kakoona_audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kakoona_audios/1
  # PATCH/PUT /kakoona_audios/1.json
  def update
    respond_to do |format|
      if @kakoona_audio.update(kakoona_audio_params)
        format.html { redirect_to @kakoona_audio, notice: 'Kakoona audio was successfully updated.' }
        format.json { render :show, status: :ok, location: @kakoona_audio }
      else
        format.html { render :edit }
        format.json { render json: @kakoona_audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kakoona_audios/1
  # DELETE /kakoona_audios/1.json
  def destroy
    @kakoona_audio.destroy
    respond_to do |format|
      format.html { redirect_to kakoona_audios_url, notice: 'Kakoona audio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kakoona_audio
      @kakoona_audio = KakoonaAudio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kakoona_audio_params
      params.require(:kakoona_audio).permit(:audio_title, :source, :artwork_url, :description, :duration, :genre, :label_name, :release_date, :waveform_url, :download_url, :stream_url, :bpm)
    end
end
