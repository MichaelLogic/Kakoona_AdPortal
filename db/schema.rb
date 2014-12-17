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

ActiveRecord::Schema.define(version: 20141217124941) do

  create_table "AdCampaigns", force: true do |t|
    t.string   "campaign_title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "slug",                          null: false
    t.string   "merchant_info_url"
    t.string   "campaign_reach"
    t.integer  "campaign_plays",    default: 0, null: false
    t.integer  "clickthru",         default: 0, null: false
    t.float    "campaign_price"
    t.integer  "merchant_id"
  end

  add_index "AdCampaigns", ["merchant_id"], name: "index_AdCampaigns_on_merchant_id"

  create_table "AdPortalOverviews", force: true do |t|
    t.integer "merchant_id"
    t.integer "total_streams",  default: 0, null: false
    t.integer "total_listens",  default: 0, null: false
    t.integer "total_clicks",   default: 0, null: false
    t.float   "clickthru_rate"
    t.string  "time_period"
  end

  add_index "AdPortalOverviews", ["merchant_id"], name: "index_AdPortalOverviews_on_merchant_id"

  create_table "Addresses", force: true do |t|
    t.integer "location_nickname"
    t.string  "address_type",      null: false
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

  create_table "CampaignAudio", id: false, force: true do |t|
    t.integer "ad_campaign_id"
    t.integer "kakoona_audio_id"
  end

  add_index "CampaignAudio", ["ad_campaign_id"], name: "index_CampaignAudio_on_ad_campaign_id"
  add_index "CampaignAudio", ["kakoona_audio_id"], name: "index_CampaignAudio_on_kakoona_audio_id"

  create_table "CampaignBrandGrffks", force: true do |t|
    t.integer  "ad_campaign_id"
    t.datetime "time_created"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
  end

  add_index "CampaignBrandGrffks", ["ad_campaign_id"], name: "index_CampaignBrandGrffks_on_ad_campaign_id"

  create_table "CampaignMainGrffks", force: true do |t|
    t.integer  "ad_campaign_id"
    t.datetime "time_created"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
  end

  add_index "CampaignMainGrffks", ["ad_campaign_id"], name: "index_CampaignMainGrffks_on_ad_campaign_id"

  create_table "CampaignPreloadGrffks", force: true do |t|
    t.integer  "ad_campaign_id"
    t.datetime "time_created"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
  end

  add_index "CampaignPreloadGrffks", ["ad_campaign_id"], name: "index_CampaignPreloadGrffks_on_ad_campaign_id"

  create_table "CampaignVideos", id: false, force: true do |t|
    t.integer "ad_campaign_id"
    t.integer "kakoona_video_id"
  end

  add_index "CampaignVideos", ["ad_campaign_id"], name: "index_CampaignVideos_on_ad_campaign_id"
  add_index "CampaignVideos", ["kakoona_video_id"], name: "index_CampaignVideos_on_kakoona_video_id"

  create_table "ContentProviderAvatar", id: false, force: true do |t|
    t.integer "avatar_grffk_id"
    t.integer "content_provider_id"
  end

  add_index "ContentProviderAvatar", ["avatar_grffk_id"], name: "index_ContentProviderAvatar_on_avatar_grffk_id"
  add_index "ContentProviderAvatar", ["content_provider_id"], name: "index_ContentProviderAvatar_on_content_provider_id"

  create_table "ContentProviderPrecious", id: false, force: true do |t|
    t.integer "content_provider_id"
    t.integer "precious_id"
  end

  add_index "ContentProviderPrecious", ["content_provider_id"], name: "index_ContentProviderPrecious_on_content_provider_id"
  add_index "ContentProviderPrecious", ["precious_id"], name: "index_ContentProviderPrecious_on_precious_id"

  create_table "ContentProviderSessions", id: false, force: true do |t|
    t.integer "content_provider_id"
    t.integer "session_id"
  end

  add_index "ContentProviderSessions", ["content_provider_id"], name: "index_ContentProviderSessions_on_content_provider_id"
  add_index "ContentProviderSessions", ["session_id"], name: "index_ContentProviderSessions_on_session_id"

  create_table "ContentProviderSocialMedia", id: false, force: true do |t|
    t.integer "content_provider_id"
    t.integer "social_media_id"
  end

  add_index "ContentProviderSocialMedia", ["content_provider_id"], name: "index_ContentProviderSocialMedia_on_content_provider_id"
  add_index "ContentProviderSocialMedia", ["social_media_id"], name: "index_ContentProviderSocialMedia_on_social_media_id"

  create_table "ContentProviders", force: true do |t|
    t.string   "email",             null: false
    t.string   "screen_name",       null: false
    t.string   "first_name",        null: false
    t.string   "middle_name"
    t.string   "last_name",         null: false
    t.string   "phone",             null: false
    t.string   "team_role",         null: false
    t.text     "rep_about"
    t.boolean  "is_active",         null: false
    t.string   "auth_token"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.datetime "last_session_time"
    t.string   "last_session_ip"
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
    t.string   "ad_campaign_id"
    t.datetime "time_uploaded"
    t.integer  "duration"
    t.string   "raw_file_name"
    t.string   "format_type"
    t.string   "file_size"
    t.integer  "vid_views",            default: 0, null: false
    t.string   "vid_url"
    t.string   "genre"
    t.text     "vid_description"
    t.text     "meta_tags"
    t.integer  "tender_video_thum_id"
  end

  add_index "KakoonaVideos", ["tender_video_thum_id"], name: "index_KakoonaVideos_on_tender_video_thum_id"

  create_table "MerchAddresses", id: false, force: true do |t|
    t.integer "merchant_id"
    t.integer "address_type_id"
  end

  add_index "MerchAddresses", ["address_type_id"], name: "index_MerchAddresses_on_address_type_id"
  add_index "MerchAddresses", ["merchant_id"], name: "index_MerchAddresses_on_merchant_id"

  create_table "MerchRepresentatives", force: true do |t|
    t.integer  "merchant_id"
    t.string   "email",             null: false
    t.string   "screen_name",       null: false
    t.string   "first_name",        null: false
    t.string   "middle_name"
    t.string   "last_name",         null: false
    t.string   "phone",             null: false
    t.string   "team_role",         null: false
    t.text     "rep_about"
    t.boolean  "is_active",         null: false
    t.string   "auth_token"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.datetime "last_session_time"
    t.string   "last_session_ip"
  end

  add_index "MerchRepresentatives", ["merchant_id"], name: "index_MerchRepresentatives_on_merchant_id"

  create_table "MerchantAvatar", id: false, force: true do |t|
    t.integer "avatar_grffk_id"
    t.integer "merchant_id"
  end

  add_index "MerchantAvatar", ["avatar_grffk_id"], name: "index_MerchantAvatar_on_avatar_grffk_id"
  add_index "MerchantAvatar", ["merchant_id"], name: "index_MerchantAvatar_on_merchant_id"

  create_table "Merchants", force: true do |t|
    t.string   "merchant_name",      null: false
    t.string   "merchant_website",   null: false
    t.boolean  "business_license",   null: false
    t.string   "chargeback_email",   null: false
    t.string   "support_email",      null: false
    t.boolean  "custom_order_init"
    t.string   "curr_monthly_sales"
    t.date     "registered_since"
    t.datetime "date_modified"
  end

  create_table "Precious", force: true do |t|
    t.string   "precious_hash"
    t.string   "precious_salt"
    t.string   "precious_hint_quest01"
    t.string   "precious_hint_answer01"
    t.string   "precious_hint_quest02"
    t.datetime "remember_precious_at"
    t.datetime "reset_precious_at"
  end

  create_table "ProductInventory", force: true do |t|
    t.integer  "ad_campaign_id"
    t.integer  "product_id"
    t.datetime "time_updated"
    t.integer  "inventory_count"
  end

  add_index "ProductInventory", ["ad_campaign_id"], name: "index_ProductInventory_on_ad_campaign_id"
  add_index "ProductInventory", ["inventory_count"], name: "index_ProductInventory_on_inventory_count"
  add_index "ProductInventory", ["product_id"], name: "index_ProductInventory_on_product_id"
  add_index "ProductInventory", ["time_updated"], name: "index_ProductInventory_on_time_updated"

  create_table "Products", force: true do |t|
    t.integer  "merchant_id"
    t.datetime "time_created"
    t.string   "product_type"
    t.string   "grffk_url"
    t.float    "price"
    t.string   "description"
    t.string   "size"
    t.string   "color"
    t.integer  "weight"
  end

  add_index "Products", ["merchant_id"], name: "index_Products_on_merchant_id"

  create_table "ProviderAddresses", id: false, force: true do |t|
    t.integer "content_provider_id"
    t.integer "address_id"
  end

  add_index "ProviderAddresses", ["address_id"], name: "index_ProviderAddresses_on_address_id"
  add_index "ProviderAddresses", ["content_provider_id"], name: "index_ProviderAddresses_on_content_provider_id"

  create_table "RepAdCampaigns", id: false, force: true do |t|
    t.integer "merch_representative_id"
    t.integer "ad_campaign_id"
  end

  add_index "RepAdCampaigns", ["ad_campaign_id"], name: "index_RepAdCampaigns_on_ad_campaign_id"
  add_index "RepAdCampaigns", ["merch_representative_id"], name: "index_RepAdCampaigns_on_merch_representative_id"

  create_table "RepAvatar", id: false, force: true do |t|
    t.integer "avatar_grffk_id"
    t.integer "merch_representative_id"
  end

  add_index "RepAvatar", ["avatar_grffk_id"], name: "index_RepAvatar_on_avatar_grffk_id"
  add_index "RepAvatar", ["merch_representative_id"], name: "index_RepAvatar_on_merch_representative_id"

  create_table "RepPrecious", id: false, force: true do |t|
    t.integer "merch_representative_id"
    t.integer "precious_id"
  end

  add_index "RepPrecious", ["merch_representative_id"], name: "index_RepPrecious_on_merch_representative_id"
  add_index "RepPrecious", ["precious_id"], name: "index_RepPrecious_on_precious_id"

  create_table "RepSessions", id: false, force: true do |t|
    t.integer "session_id"
    t.integer "merch_representative_id"
  end

  add_index "RepSessions", ["merch_representative_id"], name: "index_RepSessions_on_merch_representative_id"
  add_index "RepSessions", ["session_id"], name: "index_RepSessions_on_session_id"

  create_table "RepSocialMedia", id: false, force: true do |t|
    t.integer "social_media_id"
    t.integer "merch_representative_id"
  end

  add_index "RepSocialMedia", ["merch_representative_id"], name: "index_RepSocialMedia_on_merch_representative_id"
  add_index "RepSocialMedia", ["social_media_id"], name: "index_RepSocialMedia_on_social_media_id"

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
