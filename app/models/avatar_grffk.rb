class AvatarGrffk < ActiveRecord::Base

	validates :merch_representative, :presence => true
	belongs_to :merch_representative, inverse_of: :avatar_grffk

	has_attached_file :grffk, 
				  :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :grffk, :content_type => /\Aimage\/.*\Z/

	process_in_background :grffk, processing_image_url: "/images/processing.gif"

	before_create :set_grffk_attributes

	after_create :queue_finalize_and_cleanup

	S3_BUCKET =  AWS::S3.new.buckets[ENV['S3_BUCKET']]


  def self.finalize_and_cleanup(id)
    avi = AvatarGrffk.find(id)
    
    paperclip_file_path = avi.grffk.path
    paperclip_no_slash = paperclip_file_path[1..-1]

    cloud_asset_url_data = URI.parse(CGI.unescape(avi.cloud_asset_url))
    cloud_asset_no_slash = cloud_asset_url_data.path[1..-1]

    #obj = S3_BUCKET.objects[cloud_asset_url_data.path]
    logger.debug "SOURCE PATH::  #{cloud_asset_no_slash}" 

    logger.debug "PAPERCLIP PATH::  #{paperclip_no_slash}"

    S3_BUCKET.objects[paperclip_no_slash].copy_from(cloud_asset_no_slash, {acl: 'public-read'})
    
    #S3_BUCKET.objects[avi.cloud_asset_url].delete
    
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
    AvatarGrffk.delay(queue: "grffk_process").finalize_and_cleanup(id)
  end

end
