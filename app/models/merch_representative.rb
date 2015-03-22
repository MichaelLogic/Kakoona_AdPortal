class MerchRepresentative < ActiveRecord::Base 
  belongs_to :merchant
  #validates :merchant_id, presence: true
end
