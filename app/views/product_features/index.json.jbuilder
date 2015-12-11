json.array!(@product_features) do |product_feature|
  json.extract! product_feature, :id, :product_id, :ftr_name, :ftr_detail
  json.url product_feature_url(product_feature, format: :json)
end
