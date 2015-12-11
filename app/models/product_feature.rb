class ProductFeature < ActiveRecord::Base
  belongs_to :product

  #Nested Product Features
  has_many :product_feature_values, :dependent => :destroy
  accepts_nested_attributes_for :product_feature_values, allow_destroy: true

end
