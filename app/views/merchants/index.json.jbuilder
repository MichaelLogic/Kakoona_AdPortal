json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :merchant_name, :merchant_website, :AvatarGrffks_id, :business_license, :chargeback_email, :support_email, :custom_order_init, :curr_monthly_sales, :registered_since, :date_modified
  json.url merchant_url(merchant, format: :json)
end
