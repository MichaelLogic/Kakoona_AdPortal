class Merchant < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
end
