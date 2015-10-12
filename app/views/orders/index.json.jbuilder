json.array!(@orders) do |order|
  json.extract! order, :id, :ad_campaign_id, :selected_product_model, :quantity, :total_sale, :shipping_needed, :consumer_id, :address_line01, :address_line02, :city, :state_province, :postal_code, :country_region, :lat, :lng
  json.url order_url(order, format: :json)
end
