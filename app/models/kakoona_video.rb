class KakoonaVideo < ActiveRecord::Base
  belongs_to :ad_campaign, inverse_of: :kakoona_video

  has_attached_file :movie, :styles => {
    :converted => { :geometry => "950x540", :format => :mp4 },
    :thum_medium => { :geometry => "950x540#", :format => :jpg, :time => 10 },
    :thum_small => { :geometry => "352x200#", :format => :jpg, :time => 10 }
  }, :processors => [:transcoder]

  validates_attachment_content_type :movie, :content_type => ["video/mp4", "video/m4v", "video/mpeg", "video/quicktime"]

  process_in_background :movie, processing_image_url: "/images/processing.gif"

  before_create :set_movie_attributes

  after_create :queue_finalize_and_cleanup

  after_find :verify_asset_loc

  S3_BUCKET =  AWS::S3.new.buckets[ENV['S3_BUCKET']]


  def self.finalize_and_cleanup(id)
    vid = KakoonaVideo.find(id)
    
    paperclip_file_path = vid.movie.path
    paperclip_no_slash = paperclip_file_path[1..-1]

    #Uploaded Asset Process ****
    #Extracts raw filename 
    #Creates unescaped URL with encode filename
    upload_url = CGI.unescape(vid.cloud_asset_url)
    file_name = upload_url.split("/").last
    upload_info = upload_url.split("/")
    upload_info.pop
    full_upload_url = upload_info.join("/") + ("/") + URI.encode(file_name)

    #Uploaded Asset Process ****
    #Convert URL to URI Object 
    #replace URL-encoded filename with Raw filename
    cloud_asset_url_data = URI.parse(full_upload_url)
    cloud_asset_no_slash = cloud_asset_url_data.path[1..-1]
    cloud_asset_info = cloud_asset_no_slash.split("/")
    cloud_asset_info.pop
    full_asset_path = cloud_asset_info.join("/") + ("/") + file_name

    logger.debug "SOURCE PATH::  #{full_asset_path}" 

    logger.debug "PAPERCLIP PATH::  #{paperclip_no_slash}"

    #S3_BUCKET.objects[paperclip_no_slash].copy_from(full_asset_path, {acl: 'public-read'})

    obj = S3_BUCKET.objects[full_asset_path]
    file = Paperclip.io_adapters.for(obj.public_url)
    vid.movie = file
    vid.movie_content_type = Paperclip::ContentTypeDetector.new(file.path).detect

    #Get Duration (length) of Video
    vid.length = Paperclip.run("ffprobe", '-i %s -show_entries format=duration -v quiet -of csv="p=0"' % vid.movie.queued_for_write[:original].path).to_f

    #Save Selected Video Thumb
    vid.selected_thum = vid.movie.url(:thum_small, timestamp: false)
    logger.debug "VIDEO THUMBNAIL URL:: #{vid.movie.url(:thum_small, timestamp: false)}"


    vid.save
    
    #Delete Direct Uploaded Temp Asset
    #S3_BUCKET.objects[full_asset_path].delete
    
  end
  
  protected

    # Optional: Set attachment attributes from the direct upload instead of original upload callback params
    # @note Retry logic handles occasional S3 "eventual consistency" lag.
    def set_movie_attributes
      tries ||= 5

      #Uploaded Asset Process ****
      #Extracts raw filename 
      #Creates unescaped URL with encode filename
      upload_url = CGI.unescape(cloud_asset_url)
      file_name = upload_url.split("/").last
      upload_info = upload_url.split("/")
      upload_info.pop
      full_upload_url = upload_info.join("/") + ("/") + URI.encode(file_name)

      #Uploaded Asset Process ****
      #Convert URL to URI Object 
      #replace URL-encoded filename with Raw filename
      cloud_asset_url_data = URI.parse(full_upload_url)
      cloud_asset_no_slash = cloud_asset_url_data.path[1..-1]
      cloud_asset_info = cloud_asset_no_slash.split("/")
      cloud_asset_info.pop
      full_asset_path = cloud_asset_info.join("/") + ("/") + file_name

      direct_upload_head = S3_BUCKET.objects[full_asset_path].head 

      self.movie_file_name      = file_name
      self.movie_file_size      = direct_upload_head.content_length
      self.movie_content_type   = direct_upload_head.content_type
      self.movie_updated_at     = direct_upload_head.last_modified

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
      KakoonaVideo.delay(queue: "video_transcode").finalize_and_cleanup(id)
    end

    def verify_asset_loc
      logger.debug "****** VERIFYING ASSET LOCATION ******* "

      if self.movie_processing == false
        logger.debug "VIDEO HAS BEEN PROCESSED"
        if self.cloud_asset_url != self.movie.url(:converted, timestamp: false)
          self.cloud_asset_url = self.movie.url(:converted, timestamp: false)
          self.selected_thum = self.movie.url(:thum_small, timestamp: false)
          self.save
          logger.debug "******** NEW ASSET LOCATIONS SAVED ******** "
        else
          logger.debug "******** PERMANENT ASSET LOCATION VERIFIED ******** "
        end
      end
    end

end
