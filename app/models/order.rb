class Order < ActiveRecord::Base
  belongs_to :ad_campaign
  belongs_to :consumer
end
