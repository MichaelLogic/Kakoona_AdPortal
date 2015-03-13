class MerchRepresentative < ActiveRecord::Base
  attr_accessible :screen_name, :first_name, :middle_name, :last_name, :phone, :team_role, :rep_about
  has_one :precious 
  belongs_to :merchant
  validates :merchant_id, presence: true
end
