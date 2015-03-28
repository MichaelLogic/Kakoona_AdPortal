class Merchant < ActiveRecord::Base
	has_many :merch_representatives, dependent: :destroy
end
