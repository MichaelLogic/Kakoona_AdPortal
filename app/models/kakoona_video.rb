class KakoonaVideo < ActiveRecord::Base
  belongs_to :ad_campaign, inverse_of: :kakoona_video

  has_attached_file :movie, :styles => {
    :medium => { :geometry => "640x480", :format => 'mp4' },
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  }, :processors => [:transcoder]
  validates_attachment_content_type :movie, :content_type => ["video/mp4", "video/m4v", "video/mpeg"]
end
