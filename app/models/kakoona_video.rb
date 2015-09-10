class KakoonaVideo < ActiveRecord::Base
  belongs_to :ad_campaign, inverse_of: :kakoona_video

  has_attached_file :movie, :styles => {
    :converted => { :geometry => "950x540", :format => 'mp4' },
    :thum_medium => { :geometry => "950x540#", :format => 'jpg', :time => 10 },
    :thum_small => { :geometry => "352x200#", :format => 'jpg', :time => 10 }
  }, :processors => [:transcoder]

  validates_attachment_content_type :movie, :content_type => ["video/mp4", "video/m4v", "video/mpeg", "video/quicktime"]

  process_in_background :movie, processing_image_url: "/images/processing.gif"

  before_create do
	  file = movie.queued_for_write[:original].path
	  self.length = Paperclip.run("ffprobe", '-i %s -show_entries format=duration -v quiet -of csv="p=0"' % file).to_f
	  logger.debug "VIDEO DURATION::  #{self.length}"
	end

  before_create :set_grffk_attributes

  after_create :queue_finalize_and_cleanup

  S3_BUCKET =  AWS::S3.new.buckets[ENV['S3_BUCKET']]

def self.finalize_and_cleanup(id)
    vid = KakoonaVideo.find(id)
    
    paperclip_file_path = vid.movie.path
    paperclip_no_slash = paperclip_file_path[1..-1]

    cloud_asset_url_data = URI.parse(CGI.unescape(vid.cloud_asset_url))
    cloud_asset_no_slash = cloud_asset_url_data.path[1..-1]

    #obj = S3_BUCKET.objects[cloud_asset_url_data.path]
    logger.debug "SOURCE PATH::  #{cloud_asset_no_slash}" 

    logger.debug "PAPERCLIP PATH::  #{paperclip_no_slash}"

    S3_BUCKET.objects[paperclip_no_slash].copy_from(cloud_asset_no_slash, {acl: 'public-read'})
    
    #Delete Direct Uploaded Temp Asset
    #S3_BUCKET.objects[cloud_asset_no_slash].delete

    #Save Selected Video Thumb
    vid.selected_thum = vid.movie.url(:thumb_small, timestamp: false)
    vid.save
    logger.debug "VIDEO THUMBNAIL URL:: #{vid.movie.url(:thumb_small, timestamp: false)}"
    
    
  end
  
  protected
  
  # Optional: Set attachment attributes from the direct upload instead of original upload callback params
  # @note Retry logic handles occasional S3 "eventual consistency" lag.
  def set_grffk_attributes
    tries ||= 5

    self.movie_file_name      = movie_file_name
    self.movie_file_size      = movie_file_size
    self.movie_content_type   = movie_content_type
    self.movie_updated_at    = Time.now
  rescue AWS::S3::Errors::NoSuchKey => e
    tries -= 1
    if tries > 0
      sleep(3)
      retry
    else
      raise e
    end
  end

  # Queue final file processing
  def queue_finalize_and_cleanup
    KakoonaVideo.delay.finalize_and_cleanup(id)
  end

end
