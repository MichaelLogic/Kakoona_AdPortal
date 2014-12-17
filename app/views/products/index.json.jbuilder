json.array!(@products) do |product|
  json.extract! product, :id, :Merchants_id, :time_created, :product_type, :grffk_url, :price, :description, :size, :color, :weight
  json.url product_url(product, format: :json)
end
