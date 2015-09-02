class CreateProcessColumns < ActiveRecord::Migration
  def change
    add_column :kakoona_videos, :movie_processing, :boolean
    add_column :campaign_preload_grffks, :grffk_processing, :boolean
    add_column :campaign_brand_grffks, :grffk_processing, :boolean
    add_column :avatar_grffks, :grffk_processing, :boolean
  end
end
