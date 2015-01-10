# SQLEditor export: Rails Migration
# id columns are removed
class Builddatavault < ActiveRecord::Migration 
  def change
    create_table :Addresses do |t|
      t.integer :location_nickname
      t.string :address_type, :null => false
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
      t.references :ad_campaign, index: true
      t.datetime :time_created
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :CampaignMainGrffks do |t|
      t.references :ad_campaign, index: true
      t.datetime :time_created
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :CampaignPreloadGrffks do |t|
      t.references :ad_campaign, index: true
      t.datetime :time_created
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :ContentProviders do |t|
      t.string :email, :null => false
      t.string :screen_name, :null => false
      t.string :first_name, :null => false
      t.string :middle_name
      t.string :last_name, :null => false
      t.string :phone, :null => false
      t.string :team_role, :null => false
      t.text :rep_about
      t.boolean :is_active, :null => false
      t.string :auth_token
      t.datetime :date_created
      t.datetime :date_modified
      t.datetime :last_session_time
      t.string :last_session_ip
    end

    create_table :ContentProviderAvatars, :id => false do |t|
      t.references :avatar_grffk, index: true
      t.references :content_provider, index: true
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

    create_table :CampaignAudio, :id => false do |t|
      t.references :ad_campaign, index: true
      t.references :kakoona_audio, index: true
    end

    create_table :CampaignVideos, :id => false do |t|
      t.references :ad_campaign, index: true
      t.references :kakoona_video, index: true
    end

    create_table :merchants do |t|
      t.string :merchant_name, :null => false
      t.string :merchant_website, :null => false
      t.boolean :business_license, :null => false
      t.string :chargeback_email, :null => false
      t.string :support_email, :null => false
      t.boolean :custom_order_init
      t.string :curr_monthly_sales
      t.date :registered_since
      t.datetime :date_modified
    end

    create_table :MerchantAvatar, :id => false do |t|
      t.references :avatar_grffk, index: true
      t.references :merchant, index: true
    end

    create_table :AdPortalOverviews do |t|
      t.references :merchant, index: true
      t.integer :total_streams, :default => 0, :null => false
      t.integer :total_listens, :default => 0, :null => false
      t.integer :total_clicks, :default => 0, :null => false
      t.float :clickthru_rate
      t.string :time_period
    end

    create_table :MerchAddresses, :id => false do |t|
      t.references :merchant, index: true
      t.references :address_type, index: true
    end

    create_table :AdCampaigns do |t|
      t.string :campaign_title
      t.datetime :start_date
      t.datetime :end_date
      t.string :slug, :null => false
      t.string :merchant_info_url
      t.string :campaign_reach
      t.integer :campaign_plays, :default => 0, :null => false
      t.integer :clickthru, :default => 0, :null => false
      t.float :campaign_price
      t.references :merchant, index: true
    end

    create_table :MerchRepresentatives do |t|
      t.references :merchant, index: true
      t.string :email, :null => false
      t.string :screen_name, :null => false
      t.string :first_name, :null => false
      t.string :middle_name
      t.string :last_name, :null => false
      t.string :phone, :null => false
      t.string :team_role, :null => false
      t.text :rep_about
      t.boolean :is_active, :null => false
      t.string :auth_token
      t.datetime :date_created
      t.datetime :date_modified
      t.datetime :last_session_time
      t.string :last_session_ip
    end

    create_table :Precious do |t|
      t.string :precious_hash
      t.string :precious_salt
      t.string :precious_hint_quest01
      t.string :precious_hint_answer01
      t.string :precious_hint_quest02
      t.datetime :remember_precious_at
      t.datetime :reset_precious_at
    end

    create_table :ContentProviderPrecious, :id => false do |t|
      t.references :content_provider, index: true
      t.references :precious, index: true
    end

    create_table :Products do |t|
      t.references :merchant, index: true
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
      t.references :content_provider, index: true
      t.references :address, index: true
    end

    create_table :ProductInventory do |t|
      t.references :ad_campaign, index: true
      t.references :product, index: true
      t.datetime :time_updated, index: true
      t.integer :inventory_count, index: true
    end

    create_table :RepAdCampaigns, :id => false do |t|
      t.references :merch_representative, index: true
      t.references :ad_campaign, index: true
    end

    create_table :RepAvatar, :id => false do |t|
      t.references :avatar_grffk, index: true
      t.references :merch_representative, index: true
    end

    create_table :RepPrecious, :id => false do |t|
      t.references :merch_representative, index: true
      t.references :precious, index: true
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

    create_table :RepSessions, :id => false do |t|
      t.references :session, index: true
      t.references :merch_representative, index: true
    end

    create_table :ContentProviderSessions, :id => false do |t|
      t.references :content_provider, index: true
      t.references :session, index: true
    end

    create_table :TenderVideoThums do |t|
      t.datetime :time_created
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :ContentProviderSocialMedia, :id => false do |t|
      t.references :content_provider, index: true
      t.references :social_media, index: true
    end

    create_table :KakoonaVideos do |t|
      t.string :ad_campaign_id
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
      t.references :tender_video_thum, index: true
    end

    create_table :RepSocialMedia, :id => false do |t|
      t.references :social_media, index: true
      t.references :merch_representative, index: true
    end

  end

end
