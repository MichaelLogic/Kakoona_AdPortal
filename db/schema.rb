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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_campaigns", force: true do |t|
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
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ad_campaigns", ["merchant_id", "created_at"], name: "index_ad_campaigns_on_merchant_id_and_created_at", using: :btree
  add_index "ad_campaigns", ["merchant_id"], name: "index_ad_campaigns_on_merchant_id", using: :btree

  create_table "ad_portal_overviews", force: true do |t|
    t.integer  "merchant_id"
    t.integer  "total_streams",  default: 0, null: false
    t.integer  "total_listens",  default: 0, null: false
    t.integer  "total_clicks",   default: 0, null: false
    t.float    "clickthru_rate"
    t.string   "time_period"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "ad_portal_overviews", ["merchant_id", "created_at"], name: "index_ad_portal_overviews_on_merchant_id_and_created_at", using: :btree
  add_index "ad_portal_overviews", ["merchant_id"], name: "index_ad_portal_overviews_on_merchant_id", using: :btree

  create_table "addresses", force: true do |t|
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

  create_table "avatar_grffks", force: true do |t|
    t.integer  "merch_representative_id"
    t.string   "direct_upload_url",                       null: false
    t.string   "upload_file_path"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.boolean  "processed",               default: false, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "avatar_grffks", ["merch_representative_id"], name: "index_avatar_grffks_on_merch_representative_id", using: :btree
  add_index "avatar_grffks", ["processed"], name: "index_avatar_grffks_on_processed", using: :btree

  create_table "campaign_audio", id: false, force: true do |t|
    t.integer "ad_campaign_id"
    t.integer "kakoona_audio_id"
  end

  create_table "campaign_brand_grffks", force: true do |t|
    t.integer  "ad_campaign_id"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "campaign_brand_grffks", ["ad_campaign_id", "created_at"], name: "index_campaign_brand_grffks_on_ad_campaign_id_and_created_at", using: :btree
  add_index "campaign_brand_grffks", ["ad_campaign_id"], name: "index_campaign_brand_grffks_on_ad_campaign_id", using: :btree

  create_table "campaign_main_grffks", force: true do |t|
    t.integer  "ad_campaign_id"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "campaign_main_grffks", ["ad_campaign_id", "created_at"], name: "index_campaign_main_grffks_on_ad_campaign_id_and_created_at", using: :btree
  add_index "campaign_main_grffks", ["ad_campaign_id"], name: "index_campaign_main_grffks_on_ad_campaign_id", using: :btree

  create_table "campaign_preload_grffks", force: true do |t|
    t.integer  "ad_campaign_id"
    t.string   "raw_file_name"
    t.string   "meta_description"
    t.string   "file_type"
    t.string   "grffk_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "campaign_preload_grffks", ["ad_campaign_id", "created_at"], name: "index_campaign_preload_grffks_on_ad_campaign_id_and_created_at", using: :btree
  add_index "campaign_preload_grffks", ["ad_campaign_id"], name: "index_campaign_preload_grffks_on_ad_campaign_id", using: :btree

  create_table "campaign_videos", id: false, force: true do |t|
    t.integer "ad_campaign_id"
    t.integer "kakoona_video_id"
  end

  create_table "content_provider_avatars", id: false, force: true do |t|
    t.integer "avatar_grffk_id"
    t.integer "content_provider_id"
  end

  create_table "content_provider_precious", id: false, force: true do |t|
    t.integer "content_provider_id"
    t.integer "precious_id"
  end

  create_table "content_provider_sessions", id: false, force: true do |t|
    t.integer "content_provider_id"
    t.integer "session_id"
  end

  create_table "content_provider_social_media", id: false, force: true do |t|
    t.integer "content_provider_id"
    t.integer "social_media_id"
  end

  create_table "content_providers", force: true do |t|
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
    t.datetime "last_session_time"
    t.string   "last_session_ip"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",             null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "content_providers", ["email", "remember_token"], name: "index_content_providers_on_email_and_remember_token", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "kakoona_audio", force: true do |t|
    t.string   "audio_title"
    t.string   "source"
    t.integer  "artwork_url"
    t.string   "description"
    t.integer  "duration"
    t.string   "genre"
    t.string   "label_name"
    t.date     "release_date"
    t.string   "waveform_url"
    t.string   "download_url"
    t.string   "stream_url"
    t.float    "bpm"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "kakoona_videos", force: true do |t|
    t.string   "ad_campaign_id"
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
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "kakoona_videos", ["tender_video_thum_id", "created_at"], name: "index_kakoona_videos_on_tender_video_thum_id_and_created_at", using: :btree

  create_table "merch_addresses", id: false, force: true do |t|
    t.integer "merchant_id"
    t.integer "address_id"
  end

  create_table "merch_representatives", force: true do |t|
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
    t.datetime "last_session_time"
    t.string   "last_session_ip"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",             null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "merch_representatives", ["email", "remember_token"], name: "index_merch_representatives_on_email_and_remember_token", using: :btree
  add_index "merch_representatives", ["merchant_id", "created_at"], name: "index_merch_representatives_on_merchant_id_and_created_at", using: :btree
  add_index "merch_representatives", ["merchant_id"], name: "index_merch_representatives_on_merchant_id", using: :btree

  create_table "merchant_avatar", id: false, force: true do |t|
    t.integer "avatar_grffk_id"
    t.integer "merchant_id"
  end

  create_table "merchants", force: true do |t|
    t.string   "merchant_name",      null: false
    t.string   "merchant_website",   null: false
    t.boolean  "business_license",   null: false
    t.string   "chargeback_email",   null: false
    t.string   "support_email",      null: false
    t.boolean  "custom_order_init"
    t.string   "curr_monthly_sales"
    t.date     "registered_since"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "precious", force: true do |t|
    t.string   "precious_hash"
    t.string   "precious_salt"
    t.string   "precious_hint_quest01"
    t.string   "precious_hint_answer01"
    t.string   "precious_hint_quest02"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "product_inventory", id: false, force: true do |t|
    t.integer  "ad_campaign_id"
    t.integer  "product_id"
    t.integer  "inventory_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "product_inventory", ["ad_campaign_id"], name: "index_product_inventory_on_ad_campaign_id", using: :btree
  add_index "product_inventory", ["product_id"], name: "index_product_inventory_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.integer  "merchant_id"
    t.datetime "time_created"
    t.string   "product_type"
    t.string   "grffk_url"
    t.float    "price"
    t.string   "description"
    t.string   "size"
    t.string   "color"
    t.integer  "weight"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "products", ["merchant_id", "created_at"], name: "index_products_on_merchant_id_and_created_at", using: :btree
  add_index "products", ["merchant_id"], name: "index_products_on_merchant_id", using: :btree

  create_table "provider_addresses", id: false, force: true do |t|
    t.integer "content_provider_id"
    t.integer "address_id"
  end

  create_table "rep_ad_campaigns", id: false, force: true do |t|
    t.integer "merch_representative_id"
    t.integer "ad_campaign_id"
  end

  create_table "rep_avatars", id: false, force: true do |t|
    t.integer "avatar_grffk_id"
    t.integer "merch_representative_id"
  end

  create_table "rep_precious", id: false, force: true do |t|
    t.integer "merch_representative_id"
    t.integer "precious_id"
  end

  create_table "rep_sessions", id: false, force: true do |t|
    t.integer "session_id"
    t.integer "merch_representative_id"
  end

  create_table "rep_social_media", id: false, force: true do |t|
    t.integer "social_media_id"
    t.integer "merch_representative_id"
  end

  create_table "sessions", force: true do |t|
    t.string "curr_ip"
    t.string "device_token"
    t.string "device_spec"
  end

  create_table "social_media", force: true do |t|
    t.string  "facebook_id"
    t.boolean "facebook_autopush"
    t.string  "twitter_id"
    t.boolean "twitter_autopush"
  end

  create_table "tender_video_thums", force: true do |t|
    t.string "raw_file_name"
    t.string "meta_description"
    t.string "file_type"
    t.string "grffk_url"
  end

end
