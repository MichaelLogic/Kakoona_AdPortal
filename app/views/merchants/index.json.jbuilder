json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :merchant_name, :merchant_website, :business_license, :chargeback_email, :support_email, :custom_order_init, :curr_monthly_sales, :registered_since
  json.url merchant_url(merchant, format: :json)
end
