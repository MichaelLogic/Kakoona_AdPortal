class AvatarGrffksController < ApplicationController

  before_action :set_avatar_grffk, only: [:download]

  def create
    @merch_representative = current_merch_representative.find(params[:merch_representative_id])
    temp_direct_upload_url = CGI.unescape(params[:temp_direct_upload_url]) rescue nil
    @avatar_grffk = merch_representative.build_avatar_grffk(direct_upload_url: temp_direct_upload_url)
    @avatar_grffk.set_upload_attributes
    

    if @avatar_grffk.save 
      AvatarGrffk.delay.move_to_final_dir(@avatar_grffk.id)
      flash[:success]= 'Avatar Graphic uploaded successfully'
    else
      flash[:error] = @avatar_grffk.errors.full_messages[0] if @avatar_grffk.errors.count > 0
    end

  end

  def download
    @avatar_grffk = AvatarGrffk.find(params[:id])
    redirect_to @avatar_grffk.upload.expiring_url(30.seconds, :original)
  end

  private

  def set_avatar_grffk
    @avatar_grffk = AvatarGrffk.find(params[:id])
  end

  def avatar_grffk_params
    params.require(:avatar_grffk).permit(:merch_representative_id, :direct_upload_url, :processed)
  end
end
