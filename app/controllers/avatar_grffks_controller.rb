class AvatarGrffksController < ApplicationController

  def create
    @avatar_grffk = AvatarGrffk.new(avatar_grffk_params)
    
    # Save the upload
    if @avatar_grffk.save
      flash[:success]= 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
    end

  end

  def update
    @merch_representative = current_merch_representative.find(params[:merch_representative_id])
    @avatar_grffk = @merch_representative.avatar_grffk.find(params[:id])
    

    if @avatar_grffk.update_attributes(params[:avatar_grffk])
      flash[:success]= 'Avatar Graphic uploaded successfully'
    else
      flash[:error] = @avatar_grffk.errors.full_messages[0] if @avatar_grffk.errors.count > 0
    end

  end

  def destroy
    @merch_representative = current_merch_representative.find(params[:merch_representative_id])
    @avatar_grffk = @merch_representative.avatar_grffk.find(params[:id])
    
    if @avatar_grffk.destroy
        flash[:success]= 'Avatar Graphic destroyed'
    else
      flash[:error] = @avatar_grffk.errors.full_messages[0] if @avatar_grffk.errors.count > 0
    end
  end

  private

  def set_avatar_grffk
    @avatar_grffk = AvatarGrffk.find(params[:id])
  end

  def avatar_grffk_params
    params.require(:avatar_grffk).permit( :merch_representative_id, :name, :description, :temp_file, :cloud_asset_url )
  end
end
