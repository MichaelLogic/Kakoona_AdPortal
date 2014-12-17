class ContentProvider < ActiveRecord::Base
  belongs_to :Precious
  belongs_to :AvatarGrffks
  belongs_to :SocialMedia
  belongs_to :Sessions
end
