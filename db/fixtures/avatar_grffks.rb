puts "******** Admin Avatar Data Start************"
    
AvatarGrffk.seed do |s|
	s.id = 555
	s.merch_representative_id = 999
	s.grffk_file_name = "joel_admin_pic.jpg"
	s.grffk_content_type = "image/jpg"
	s.grffk_file_size = 107427
	s.grffk_updated_at = Time.now
	s.cloud_asset_url = "https://adportal-kakoona.s3.amazonaws.com/uploads%2F3fe03bfd-4b48-4044-ade4-3de821ee65e6%2Fjoel_admin_pic.jpg"
end

puts "********End of Admin Avatar Data************"