class KakoonaVideo < ActiveRecord::Base
  belongs_to :ad_campaign, inverse_of: :kakoona_video

  has_attached_file :movie, :styles => {
    :converted => { :geometry => "950x540", :format => 'mp4' },
    :thum_medium => { :geometry => "950x540#", :format => 'jpg', :time => 10 },
    :thum_small => { :geometry => "352x200#", :format => 'jpg', :time => 10 }
  }, :processors => [:transcoder]

  validates_attachment_content_type :movie, :content_type => ["video/mp4", "video/m4v", "video/mpeg", "video/quicktime"]

  #process_in_background :movie, processing_image_url: "/images/processing.gif"

end
