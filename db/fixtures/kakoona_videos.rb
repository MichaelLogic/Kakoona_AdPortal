puts "******** Sample Kakoona Video Data Start************"
    
KakoonaVideo.seed do |s|
	s.id = 2
	s.ad_campaign_id = 2
	s.movie_file_name = "sample_mpeg4.mp4"
	s.movie_content_type = "video/mp4"
	s.movie_file_size = 1476260
	s.movie_updated_at = Time.now
	s.title = "Sample Video For Dev"
	s.description = "This is a really generic sample video.  Bad Dimensions."
	s.cloud_asset_url = "https://s3.amazonaws.com/adportal-kakoona/kakoona_videos/movies/000/000/042/original/sample_mpeg4.mp4"
	s.selected_thum = "https://s3.amazonaws.com/adportal-kakoona/kakoona_videos/movies/000/000/042/thum_medium/ZenLabs.jpg"
end

puts "********End of Sample Kakoona Video Data************"