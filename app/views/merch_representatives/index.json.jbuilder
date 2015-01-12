json.array!(@merch_representatives) do |merch_representative|
  json.extract! merch_representative, :id, :merchant_id, :email, :screen_name, :first_name, :middle_name, :last_name, :phone, :team_role, :rep_about, :is_active, :auth_token, :last_session_time, :last_session_ip
  json.url merch_representative_url(merch_representative, format: :json)
end
