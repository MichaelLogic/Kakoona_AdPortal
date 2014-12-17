class MerchRepresentative < ActiveRecord::Base
  belongs_to :merchant
  has_one :precious
  has_one :avatar_grffk
  has_one :social_media
  has_one :session
end
