class Product < ActiveRecord::Base
  belongs_to :ad_campaign, inverse_of: :product

  has_attached_file :grffk, 
  					:styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :grffk, :content_type => /\Aimage\/.*\Z/

  enum product_type: {simple: 1, digital: 2, configurable: 3}

  #Nested Product Features
  has_many :product_features, :dependent => :destroy
  accepts_nested_attributes_for :product_features, allow_destroy: true

  #Nested SKU Variants
  has_many :product_sku_variants, :dependent => :destroy
  accepts_nested_attributes_for :product_sku_variants, allow_destroy: true

  after_initialize :init

  process_in_background :grffk

  before_create :set_grffk_attributes

  after_create :queue_finalize_and_cleanup

  after_find :verify_asset_loc

  S3_BUCKET =  AWS::S3.new.buckets[ENV['S3_BUCKET']]


  def self.finalize_and_cleanup(id)
    product_grffk = Product.find(id)
    
    #PaperClip Path Process
    paperclip_file_path = product_grffk.grffk.path
    paperclip_no_slash = paperclip_file_path[1..-1]

    #Uploaded Asset Process ****
    #Extracts raw filename 
    #Creates unescaped URL with encode filename
    upload_url = CGI.unescape(product_grffk.cloud_asset_url)
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
    product_grffk.grffk = file
    product_grffk.grffk_content_type = Paperclip::ContentTypeDetector.new(file.path).detect

    product_grffk.save

    #Delete Direct Uploaded Temp Asset
    #S3_BUCKET.objects[full_asset_path].delete
  end
  
  protected
  
    # Optional: Set attachment attributes from the direct upload instead of original upload callback params
    # @note Retry logic handles occasional S3 "eventual consistency" lag.
    def set_grffk_attributes
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

        self.grffk_file_name      = file_name
        self.grffk_file_size      = direct_upload_head.content_length
        self.grffk_content_type   = direct_upload_head.content_type
        self.grffk_updated_at     = direct_upload_head.last_modified
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
      Product.delay(queue: "product_process").finalize_and_cleanup(id)
    end

    def verify_asset_loc
      logger.debug "****** VERIFYING PRODUCT IMAGE LOCATION ******* "

      if self.grffk_processing == false
        logger.debug "PRODUCT IMAGE HAS BEEN PROCESSED"
        if self.cloud_asset_url != self.grffk.url(:medium, timestamp: false)
          self.cloud_asset_url = self.grffk.url(:medium, timestamp: false)
          self.save
          logger.debug "******** PRODUCT IMAGE LOCATIONS SAVED ******** "
        else
          logger.debug "******** PERMANENT PRODUCT IMAGE LOCATION VERIFIED ******** "
        end
      end
    end
 
  private

    def init
      if self.new_record? && self.product_type.nil?
        self.product_type = :configurable
      end
    end

end
