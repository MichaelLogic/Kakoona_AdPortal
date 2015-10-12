puts "********Seeding Merchant Reps Data Start************"

MerchRepresentative.seed do |s|
	s.id = 999
	s.merchant_id = 1
	s.email = "joel@kakoona.com"
	s.screen_name = "Joel_CEO"
	s.first_name = "Joel"
	s.middle_name = "CEO"
	s.last_name = "Hilliard"
	s.phone = "303.859.2503"
	s.team_role = "special"
	s.rep_about = "Joel is the CEO and co-founder of Kakoona Inc."
	s.is_active = true
	s.last_session_time = Time.now
	s.last_session_ip = "127.0.0.1"
	s.password = "kakoona"
	s.password_confirmation = "kakoona"
	s.remember_token = ""
	s.admin = true
end


puts "********End of Merchant Reps Data************"