# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141216222739) do

  create_table "AdCampaigns", force: true do |t|
    t.string   "campaign_title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "slug",                                 null: false
    t.integer  "KakoonaVideos_id"
    t.integer  "KakoonaAudio_id"
    t.integer  "campaign_main_grffk_id"
    t.integer  "CampaignPreloadGrffks_id"
    t.string   "merchant_info_url"
    t.integer  "CampaignBrandGrffks_id"
    t.string   "campaign_reach"
    t.integer  "campaign_plays",           default: 0, null: false
    t.integer  "clickthru",                default: 0, null: false
    t.float    "campaign_price"
    t.integer  "Merchants_id"
  end

  create_table "AdPortalOverviews", force: true do |t|
    t.integer "Merchants_id"
    t.integer "total_streams",  default: 0, null: false
    t.integer "total_listens",  default: 0, null: false
    t.integer "total_clicks",   default: 0, null: false
    t.float   "clickthru_rate"
    t.string  "time_period"
  end

  create_table "Addresses", force: true do |t|
    t.integer "location_nickname"
    t.string  "address_line01"
    t.string  "address_line02"
    t.string  "city"
    t.string  "state_province"
    t.string  "postal_code"
    t.string  "country_region"
    t.float   "lat"
    t.float   "lng"
  end

  create_table "AvatarGrffks", force: true do |t|
    t.string   "avatar_type"
    t.datetime "time_created"
    t.string   "file_type"
    t.string   "grffk_url"
  end

  create_table "CampaignBrandGrffks", force: true do |t|
    t.datetime "time_created"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
  end

  create_table "CampaignMainGrffks", force: true do |t|
    t.datetime "time_created"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
  end

  create_table "CampaignPreloadGrffks", force: true do |t|
    t.datetime "time_created"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
  end

  create_table "ContentProviders", force: true do |t|
    t.string   "email",             null: false
    t.integer  "Precious_id"
    t.string   "screen_name",       null: false
    t.string   "first_name",        null: false
    t.string   "middle_name"
    t.string   "last_name",         null: false
    t.string   "phone",             null: false
    t.string   "team_role",         null: false
    t.text     "rep_about"
    t.boolean  "is_active",         null: false
    t.integer  "AvatarGrffks_id"
    t.string   "auth_token"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.integer  "SocialMedia_id"
    t.datetime "last_session_time"
    t.string   "last_session_ip"
    t.integer  "Sessions_id"
  end

  create_table "KakoonaAudio", force: true do |t|
    t.string  "audio_title"
    t.string  "source"
    t.integer "artwork_url"
    t.string  "description"
    t.integer "duration"
    t.string  "genre"
    t.string  "label_name"
    t.date    "release_date"
    t.string  "waveform_url"
    t.string  "download_url"
    t.string  "stream_url"
    t.float   "bpm"
  end

  create_table "KakoonaVideos", force: true do |t|
    t.string   "vid_title"
    t.datetime "time_uploaded"
    t.integer  "duration"
    t.string   "raw_file_name"
    t.string   "format_type"
    t.string   "file_size"
    t.integer  "vid_views",           default: 0, null: false
    t.string   "vid_url"
    t.string   "genre"
    t.text     "vid_description"
    t.text     "meta_tags"
    t.integer  "TenderVideoThums_id"
  end

  create_table "MerchAddresses", id: false, force: true do |t|
    t.integer "Merchants_id"
    t.integer "Addresses_id"
    t.string  "address_type", null: false
  end

  create_table "MerchRepresentatives", force: true do |t|
    t.integer  "Merchants_id"
    t.string   "email",             null: false
    t.integer  "Precious_id"
    t.string   "screen_name",       null: false
    t.string   "first_name",        null: false
    t.string   "middle_name"
    t.string   "last_name",         null: false
    t.string   "phone",             null: false
    t.string   "team_role",         null: false
    t.text     "rep_about"
    t.boolean  "is_active",         null: false
    t.integer  "AvatarGrffks_id"
    t.string   "auth_token"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.integer  "SocialMedia_id"
    t.datetime "last_session_time"
    t.string   "last_session_ip"
    t.integer  "Sessions_id"
  end

  create_table "Merchants", force: true do |t|
    t.string   "merchant_name",      null: false
    t.string   "merchant_website",   null: false
    t.integer  "AvatarGrffks_id"
    t.boolean  "business_license",   null: false
    t.string   "chargeback_email",   null: false
    t.string   "support_email",      null: false
    t.boolean  "custom_order_init"
    t.string   "curr_monthly_sales"
    t.date     "registered_since"
    t.datetime "date_modified"
  end

  create_table "Precious", force: true do |t|
    t.integer  "rep_id"
    t.string   "precious_hash"
    t.string   "precious_salt"
    t.string   "precious_hint_quest01"
    t.string   "precious_hint_answer01"
    t.string   "precious_hint_quest02"
    t.datetime "remember_precious_at"
    t.datetime "reset_precious_at"
    t.integer  "content_provider_id"
  end

  create_table "ProductInventory", id: false, force: true do |t|
    t.integer  "AdCampaigns_id"
    t.integer  "Products_id"
    t.datetime "time_updated"
    t.integer  "inventory_count"
  end

  create_table "Products", force: true do |t|
    t.integer  "Merchants_id"
    t.datetime "time_created"
    t.string   "product_type"
    t.string   "grffk_url"
    t.float    "price"
    t.string   "description"
    t.string   "size"
    t.string   "color"
    t.integer  "weight"
  end

  create_table "ProviderAddresses", id: false, force: true do |t|
    t.integer "ContentProviders_id"
    t.integer "Addresses_id"
    t.string  "address_type",        null: false
  end

  create_table "RepAdCampaigns", id: false, force: true do |t|
    t.integer "MerchRepresentatives_id"
    t.integer "AdCampaigns_id"
  end

  create_table "Sessions", force: true do |t|
    t.datetime "time_created"
    t.string   "curr_ip"
    t.string   "device_token"
  end

  create_table "SocialMedia", force: true do |t|
    t.string  "facebook_id"
    t.boolean "facebook_autopush"
    t.string  "twitter_id"
    t.boolean "twitter_autopush"
  end

  create_table "TenderVideoThums", force: true do |t|
    t.datetime "time_created"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
  end

end
