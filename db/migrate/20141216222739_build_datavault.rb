class BuildDatavault < ActiveRecord::Migration
  def change
    create_table :Addresses do |t|
      t.integer :location_nickname
      t.string :address_line01
      t.string :address_line02
      t.string :city
      t.string :state_province
      t.string :postal_code
      t.string :country_region
      t.float :lat
      t.float :lng
    end

    create_table :AvatarGrffks do |t|
      t.string :avatar_type
      t.datetime :time_created
      t.string :file_type
      t.string :grffk_url
    end

    create_table :CampaignBrandGrffks do |t|
      t.datetime :time_created
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :CampaignMainGrffks do |t|
      t.datetime :time_created
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :CampaignPreloadGrffks do |t|
      t.datetime :time_created
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :KakoonaAudio do |t|
      t.string :audio_title
      t.string :source
      t.integer :artwork_url
      t.string :description
      t.integer :duration
      t.string :genre
      t.string :label_name
      t.date :release_date
      t.string :waveform_url
      t.string :download_url
      t.string :stream_url
      t.float :bpm
    end

    create_table :Merchants do |t|
      t.string :merchant_name, :null => false
      t.string :merchant_website, :null => false
      t.references :AvatarGrffks
      t.boolean :business_license, :null => false
      t.string :chargeback_email, :null => false
      t.string :support_email, :null => false
      t.boolean :custom_order_init
      t.string :curr_monthly_sales
      t.date :registered_since
      t.datetime :date_modified
    end

    create_table :AdPortalOverviews do |t|
      t.references :Merchants
      t.integer :total_streams, :default => 0, :null => false
      t.integer :total_listens, :default => 0, :null => false
      t.integer :total_clicks, :default => 0, :null => false
      t.float :clickthru_rate
      t.string :time_period
    end

    create_table :MerchAddresses, :id => false do |t|
      t.references :Merchants
      t.references :Addresses
      t.string :address_type, :null => false
    end

    create_table :Precious do |t|
      t.integer :rep_id
      t.string :precious_hash
      t.string :precious_salt
      t.string :precious_hint_quest01
      t.string :precious_hint_answer01
      t.string :precious_hint_quest02
      t.datetime :remember_precious_at
      t.datetime :reset_precious_at
      t.integer :content_provider_id
    end

    create_table :AdCampaigns do |t|
      t.string :campaign_title
      t.datetime :start_date
      t.datetime :end_date
      t.string :slug, :null => false
      t.references :KakoonaVideos
      t.references :KakoonaAudio
      t.integer :campaign_main_grffk_id
      t.references :CampaignPreloadGrffks
      t.string :merchant_info_url
      t.references :CampaignBrandGrffks
      t.string :campaign_reach
      t.integer :campaign_plays, :default => 0, :null => false
      t.integer :clickthru, :default => 0, :null => false
      t.float :campaign_price
      t.references :Merchants
    end

    create_table :Products do |t|
      t.references :Merchants
      t.datetime :time_created
      t.string :product_type
      t.string :grffk_url
      t.float :price
      t.string :description
      t.string :size
      t.string :color
      t.integer :weight
    end

    create_table :ProviderAddresses, :id => false do |t|
      t.references :ContentProviders
      t.references :Addresses
      t.string :address_type, :null => false
    end

    create_table :ProductInventory, :id => false do |t|
      t.references :AdCampaigns
      t.references :Products
      t.datetime :time_updated
      t.integer :inventory_count
    end

    create_table :RepAdCampaigns, :id => false do |t|
      t.references :MerchRepresentatives
      t.references :AdCampaigns
    end

    create_table :Sessions do |t|
      t.datetime :time_created
      t.string :curr_ip
      t.string :device_token
    end

    create_table :SocialMedia do |t|
      t.string :facebook_id
      t.boolean :facebook_autopush
      t.string :twitter_id
      t.boolean :twitter_autopush
    end

    create_table :MerchRepresentatives do |t|
      t.references :Merchants
      t.string :email, :null => false
      t.references :Precious
      t.string :screen_name, :null => false
      t.string :first_name, :null => false
      t.string :middle_name
      t.string :last_name, :null => false
      t.string :phone, :null => false
      t.string :team_role, :null => false
      t.text :rep_about
      t.boolean :is_active, :null => false
      t.references :AvatarGrffks
      t.string :auth_token
      t.datetime :date_created
      t.datetime :date_modified
      t.references :SocialMedia
      t.datetime :last_session_time
      t.string :last_session_ip
      t.references :Sessions
    end

    create_table :ContentProviders do |t|
      t.string :email, :null => false
      t.references :Precious
      t.string :screen_name, :null => false
      t.string :first_name, :null => false
      t.string :middle_name
      t.string :last_name, :null => false
      t.string :phone, :null => false
      t.string :team_role, :null => false
      t.text :rep_about
      t.boolean :is_active, :null => false
      t.references :AvatarGrffks
      t.string :auth_token
      t.datetime :date_created
      t.datetime :date_modified
      t.references :SocialMedia
      t.datetime :last_session_time
      t.string :last_session_ip
      t.references :Sessions
    end

    create_table :TenderVideoThums do |t|
      t.datetime :time_created
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :KakoonaVideos do |t|
      t.string :vid_title
      t.datetime :time_uploaded
      t.integer :duration
      t.string :raw_file_name
      t.string :format_type
      t.string :file_size
      t.integer :vid_views, :default => 0, :null => false
      t.string :vid_url
      t.string :genre
      t.text :vid_description
      t.text :meta_tags
      t.references :TenderVideoThums
    end

  end
end
