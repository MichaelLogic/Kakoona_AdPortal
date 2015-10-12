class OrderSerializer < ActiveModel::Serializer
  attributes :id, :selected_product_model, :quantity, :total_sale, :shipping_needed, :address_line01, :address_line02, :city, :state_province, :postal_code, :country_region, :lat, :lng
  has_one :ad_campaign
  has_one :consumer
end
