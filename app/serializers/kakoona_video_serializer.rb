class KakoonaVideoSerializer < ActiveModel::Serializer

  attributes :title, :length, :description, :movie_views, :cloud_asset_url, :selected_thum
  
end
