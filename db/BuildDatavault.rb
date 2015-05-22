# SQLEditor export: Rails Migration
# id columns are removed
class BuildDatavault < ActiveRecord::Migration 
  def change
    create_table :addresses do |t|
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

    create_table :avatar_grffks do |t|
      t.belongs_to :merch_representative, index: true
      t.string   :name
      t.string   :description
      t.string   :temp_file
      t.string   :cloud_asset_url
      t.timestamps :null=> false
    end

    create_table :campaign_brand_grffks do |t|
      t.references :ad_campaign, index: true
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
      t.timestamps :null=> false
    end
    add_index :campaign_brand_grffks, [:ad_campaign_id, :created_at]

    create_table :campaign_main_grffks do |t|
      t.references :ad_campaign, index: true
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
      t.timestamps :null=> false
    end
    add_index :campaign_main_grffks, [:ad_campaign_id, :created_at]

    create_table :campaign_preload_grffks do |t|
      t.references :ad_campaign, index: true
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
      t.timestamps :null=> false
    end
    add_index :campaign_preload_grffks, [:ad_campaign_id, :created_at]

    create_table :content_providers do |t|
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
      t.datetime :last_session_time
      t.string :last_session_ip
      t.timestamps :null=> false
    end

    create_table :kakoona_audio do |t|
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
      t.timestamps :null=> false
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
      t.timestamps :null=> false
    end

    create_table :merch_representatives do |t|
      t.belongs_to :merchant, index: true
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
      t.datetime :last_session_time
      t.string :last_session_ip
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin, :null => false
      t.timestamps :null=> false
    end
    add_index :merch_representatives, [:email, :remember_token]
    add_index :merch_representatives, [:merchant_id, :created_at]

    create_table :ad_portal_overviews do |t|
      t.references :merchant, index: true
      t.integer :total_streams, :default => 0, :null => false
      t.integer :total_listens, :default => 0, :null => false
      t.integer :total_clicks, :default => 0, :null => false
      t.float :clickthru_rate
      t.string :time_period
      t.timestamps :null=> false
    end
    add_index :ad_portal_overviews, [:merchant_id, :created_at]

    create_table :ad_campaigns do |t|
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
      t.timestamps :null=> false
    end
    add_index :ad_campaigns, [:merchant_id, :created_at]

    create_table :precious do |t|
      t.string :precious_hash
      t.string :precious_salt
      t.string :precious_hint_quest01
      t.string :precious_hint_answer01
      t.string :precious_hint_quest02
      t.timestamps :null=> false
    end

    create_table :products do |t|
      t.references :merchant, index: true
      t.datetime :time_created
      t.string :product_type
      t.string :grffk_url
      t.float :price
      t.string :description
      t.string :size
      t.string :color
      t.integer :weight
      t.timestamps :null=> false
    end
    add_index :products, [:merchant_id, :created_at]

    create_table :product_inventory, :id => false do |t|
      t.references :ad_campaign, index: true
      t.references :product, index: true
      t.integer :inventory_count
      t.timestamps :null=> false
    end

    create_table :sessions do |t|
      t.string :curr_ip
      t.string :device_token
      t.string :device_spec
    end

    create_table :social_media do |t|
      t.string :facebook_id
      t.boolean :facebook_autopush
      t.string :twitter_id
      t.boolean :twitter_autopush
    end

    create_table :tender_video_thums do |t|
      t.string :raw_file_name
      t.string :meta_description
      t.string :file_type
      t.string :grffk_url
    end

    create_table :kakoona_videos do |t|
      t.string :ad_campaign_id
      t.integer :duration
      t.string :raw_file_name
      t.string :format_type
      t.string :file_size
      t.integer :vid_views, :default => 0, :null => false
      t.string :vid_url
      t.string :genre
      t.text :vid_description
      t.text :meta_tags
      t.references :tender_video_thum
      t.timestamps :null=> false
    end
    add_index :kakoona_videos, [:tender_video_thum_id, :created_at]

  end

end
