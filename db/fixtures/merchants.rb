puts "********Seeding Merchant Data Start************"
    
Merchant.seed do |s|
	s.id = 1
	s.merchant_name = "Hasbro"
	s.merchant_website = "www.Hasbro.com"
	s.business_license = true
	s.chargeback_email = "moneyback@hasbro.com"
	s.support_email = "support@hasbro.com"
	s.custom_order_init = false
	s.curr_monthly_sales = 35150000.00
	s.registered_since = Time.now
end

Merchant.seed do |s|
	s.id = 2
	s.merchant_name = "Abercrombie & Fitch"
	s.merchant_website = "www.abercrombie.com"
	s.business_license = true
	s.chargeback_email = "moneyback@abercrombie.com"
	s.support_email = "support@abercrombie.com"
	s.custom_order_init = false
	s.curr_monthly_sales = 2250000.00
	s.registered_since = Time.now
end

Merchant.seed do |s|
	s.id = 3
	s.merchant_name = "American Eagle"
	s.merchant_website = "www.americaneagle.com"
	s.business_license = true
	s.chargeback_email = "moneyback@americaneagle.com"
	s.support_email = "support@americaneagle.com"
	s.custom_order_init = false
	s.curr_monthly_sales = 14250000.00
	s.registered_since = Time.now
end

Merchant.seed do |s|
	s.id = 4
	s.merchant_name = "Bose"
	s.merchant_website = "www.Bose.com"
	s.business_license = true
	s.chargeback_email = "moneyback@bose.com"
	s.support_email = "support@bose.com"
	s.custom_order_init = false
	s.curr_monthly_sales = 14250000.00
	s.registered_since = Time.now
end


puts "********End of Merchant Data************"