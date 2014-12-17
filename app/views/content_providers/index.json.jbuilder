json.array!(@content_providers) do |content_provider|
  json.extract! content_provider, :id, :email, :Precious_id, :screen_name, :first_name, :middle_name, :last_name, :phone, :team_role, :rep_about, :is_active, :AvatarGrffks_id, :auth_token, :date_created, :date_modified, :SocialMedia_id, :last_session_time, :last_session_ip, :Sessions_id
  json.url content_provider_url(content_provider, format: :json)
end
