json.array!(@kakoona_videos) do |kakoona_video|
  json.extract! kakoona_video, :id, :ad_campaign_id, :duration, :raw_file_name, :format_type, :file_size, :vid_views, :vid_url, :genre, :vid_description, :meta_tags, :tender_video_thum_id
  json.url kakoona_video_url(kakoona_video, format: :json)
end
