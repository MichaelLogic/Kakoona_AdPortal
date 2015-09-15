class CampaignPreloadGrffk < ActiveRecord::Base
  belongs_to :ad_campaign, inverse_of: :campaign_preload_grffk

  has_attached_file :grffk, 
  					:styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :grffk, :content_type => /\Aimage\/.*\Z/
 
  before_create :set_grffk_attributes

  after_create :queue_finalize_and_cleanup


  S3_BUCKET =  AWS::S3.new.buckets[ENV['S3_BUCKET']]


  def self.finalize_and_cleanup(id)
    preload_grffk = CampaignPreloadGrffk.find(id)
    
    #PaperClip Path Process
    paperclip_file_path = preload_grffk.grffk.path
    paperclip_no_slash = paperclip_file_path[1..-1]

    #Uploaded Asset Process ****
    #Extracts raw filename 
    #Creates unescaped URL with encode filename
    upload_url = CGI.unescape(preload_grffk.cloud_asset_url)
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

    S3_BUCKET.objects[paperclip_no_slash].copy_from(full_asset_path, {acl: 'public-read'})
    
    #S3_BUCKET.objects[full_asset_path].delete
    
  end
  
  protected
  
  # Optional: Set attachment attributes from the direct upload instead of original upload callback params
  # @note Retry logic handles occasional S3 "eventual consistency" lag.
  def set_grffk_attributes
    tries ||= 5

    self.grffk_file_name      = grffk_file_name
    self.grffk_file_size      = grffk_file_size
    self.grffk_content_type   = grffk_content_type
    self.grffk_updated_at    = Time.now
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
    CampaignPreloadGrffk.delay(queue: "grffk_process").finalize_and_cleanup(id)
  end

  def verify_asset_loc
    logger.debug "****** VERIFYING PRELOAD GRAPHIC ASSET LOCATION ******* "

    if self.grffk_processing == false
      logger.debug "PRELOAD GRAPHIC HAS BEEN PROCESSED"
      if self.cloud_asset_url != self.grffk.url(:medium, timestamp: false)
        self.cloud_asset_url = self.grffk.url(:medium, timestamp: false)
        self.save
        logger.debug "******** NEW PRELOAD GRAPHIC ASSET LOCATIONS SAVED ******** "
      else
        logger.debug "******** PERMANENT PRELOAD GRAPHIC ASSET LOCATION VERIFIED ******** "
      end
    end
  end

end
