puts "********Seeding Merchant Reps Data Start************"
   
MerchRepresentative.seed do |s|
	s.id = 1
	s.merchant_id = 1
	s.email = "scott@michaellogic.com"
	s.screen_name = "ScottTiger"
	s.first_name = "Scott"
	s.middle_name = ""
	s.last_name = "Tiger"
	s.phone = "312.555.5555"
	s.team_role = "representative"
	s.rep_about = "Scott Tiger is a great guy.  He works for Kakoona Inc. as a Ruby Developer."
	s.is_active = true
	s.last_session_time = Time.now
	s.last_session_ip = "127.0.0.1"
	s.password = "kakoona"
	s.password_confirmation = "kakoona"
	s.remember_token = ""
	s.admin = true
end

MerchRepresentative.seed do |s|
	s.id = 2
	s.merchant_id = 1
	s.email = "trump@kakoona.com"
	s.screen_name = "Trumpster"
	s.first_name = "Donald"
	s.middle_name = ""
	s.last_name = "Trump"
	s.phone = "312.555.5555"
	s.team_role = "representative"
	s.rep_about = "Donald Trump is a great guy.  He works for Kakoona Inc. as a Ruby Developer."
	s.is_active = true
	s.last_session_time = Time.now
	s.last_session_ip = "127.0.0.1"
	s.password = "kakoona"
	s.password_confirmation = "kakoona"
	s.remember_token = ""
	s.admin = true
end


puts "********End of Merchant Reps Data************"