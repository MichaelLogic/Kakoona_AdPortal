json.array!(@merch_representatives) do |merch_representative|
  json.extract! merch_representative, :id, :Merchants_id, :email, :Precious_id, :screen_name, :first_name, :middle_name, :last_name, :phone, :team_role, :rep_about, :is_active, :AvatarGrffks_id, :auth_token, :date_created, :date_modified, :SocialMedia_id, :last_session_time, :last_session_ip, :Sessions_id
  json.url merch_representative_url(merch_representative, format: :json)
end
