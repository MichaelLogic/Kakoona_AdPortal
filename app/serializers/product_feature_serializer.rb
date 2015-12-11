class ProductFeatureSerializer < ActiveModel::Serializer
  attributes :id, :ftr_name, :ftr_detail
  has_one :product
end
