json.array!(@content_providers) do |content_provider|
  json.extract! content_provider, :id, :email, :screen_name, :first_name, :middle_name, :last_name, :phone, :team_role, :rep_about, :is_active, :auth_token, :last_session_time, :last_session_ip
  json.url content_provider_url(content_provider, format: :json)
end
