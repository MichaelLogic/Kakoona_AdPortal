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

ActiveRecord::Schema.define(version: 20151121005604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "hstore"

  create_table "ad_campaigns", force: true do |t|
    t.integer  "merch_representative_id"
    t.string   "campaign_title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "slug"
    t.string   "merchant_info_url"
    t.string   "campaign_reach"
    t.integer  "campaign_plays",          default: 0, null: false
    t.integer  "clickthru",               default: 0, null: false
    t.integer  "purchases",               default: 0, null: false
    t.float    "campaign_price"
    t.integer  "merchant_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "ad_campaigns", ["merch_representative_id", "created_at"], name: "index_ad_campaigns_on_merch_representative_id_and_created_at", using: :btree
  add_index "ad_campaigns", ["merch_representative_id"], name: "index_ad_campaigns_on_merch_representative_id", using: :btree
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
    t.string   "grffk_file_name"
    t.string   "grffk_content_type"
    t.integer  "grffk_file_size"
    t.datetime "grffk_updated_at"
    t.string   "cloud_asset_url"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "grffk_processing"
  end

  add_index "avatar_grffks", ["merch_representative_id"], name: "index_avatar_grffks_on_merch_representative_id", using: :btree

  create_table "campaign_brand_grffks", force: true do |t|
    t.integer  "ad_campaign_id"
    t.string   "grffk_file_name"
    t.string   "grffk_content_type"
    t.integer  "grffk_file_size"
    t.datetime "grffk_updated_at"
    t.string   "cloud_asset_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "grffk_processing"
  end

  add_index "campaign_brand_grffks", ["ad_campaign_id", "created_at"], name: "index_campaign_brand_grffks_on_ad_campaign_id_and_created_at", using: :btree
  add_index "campaign_brand_grffks", ["ad_campaign_id"], name: "index_campaign_brand_grffks_on_ad_campaign_id", using: :btree

  create_table "campaign_preload_grffks", force: true do |t|
    t.integer  "ad_campaign_id"
    t.string   "grffk_file_name"
    t.string   "grffk_content_type"
    t.integer  "grffk_file_size"
    t.datetime "grffk_updated_at"
    t.string   "cloud_asset_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "grffk_processing"
  end

  add_index "campaign_preload_grffks", ["ad_campaign_id", "created_at"], name: "index_campaign_preload_grffks_on_ad_campaign_id_and_created_at", using: :btree
  add_index "campaign_preload_grffks", ["ad_campaign_id"], name: "index_campaign_preload_grffks_on_ad_campaign_id", using: :btree

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
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

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

  create_table "kakoona_videos", force: true do |t|
    t.integer  "ad_campaign_id"
    t.string   "movie_file_name"
    t.string   "movie_content_type"
    t.integer  "movie_file_size"
    t.datetime "movie_updated_at"
    t.float    "length"
    t.string   "title"
    t.string   "description"
    t.integer  "movie_views",        default: 0, null: false
    t.string   "cloud_asset_url"
    t.string   "selected_thum"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "movie_processing"
  end

  add_index "kakoona_videos", ["ad_campaign_id", "created_at"], name: "index_kakoona_videos_on_ad_campaign_id_and_created_at", using: :btree
  add_index "kakoona_videos", ["ad_campaign_id"], name: "index_kakoona_videos_on_ad_campaign_id", using: :btree

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

  create_table "orders", force: true do |t|
    t.integer  "ad_campaign_id"
    t.string   "selected_product_model"
    t.integer  "quantity"
    t.float    "total_sale"
    t.boolean  "shipping_needed",        default: true, null: false
    t.string   "consumer_id"
    t.string   "address_line01"
    t.string   "address_line02"
    t.string   "city"
    t.string   "state_province"
    t.string   "postal_code"
    t.string   "country_region"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "orders", ["ad_campaign_id"], name: "index_orders_on_ad_campaign_id", using: :btree

  create_table "product_feature_values", force: true do |t|
    t.integer "product_feature_id"
    t.string  "value",              null: false
    t.string  "abbreviation"
  end

  add_index "product_feature_values", ["product_feature_id"], name: "index_product_feature_values_on_product_feature_id", using: :btree

  create_table "product_features", force: true do |t|
    t.integer "product_id"
    t.string  "ftr_name"
    t.string  "ftr_detail"
  end

  add_index "product_features", ["product_id"], name: "index_product_features_on_product_id", using: :btree

  create_table "product_inventory", id: false, force: true do |t|
    t.integer  "ad_campaign_id"
    t.integer  "product_id"
    t.integer  "inventory_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "product_inventory", ["ad_campaign_id"], name: "index_product_inventory_on_ad_campaign_id", using: :btree
  add_index "product_inventory", ["product_id"], name: "index_product_inventory_on_product_id", using: :btree

  create_table "product_sku_variants", force: true do |t|
    t.integer  "product_id"
    t.string   "sku",                                   null: false
    t.text     "feature_set",              default: [],              array: true
    t.text     "description"
    t.float    "price"
    t.integer  "in_stock"
    t.string   "gal_grffk01_file_name"
    t.string   "gal_grffk01_content_type"
    t.integer  "gal_grffk01_file_size"
    t.datetime "gal_grffk01_updated_at"
    t.string   "cloud_asset01_url"
    t.string   "gal_grffk02_file_name"
    t.string   "gal_grffk02_content_type"
    t.integer  "gal_grffk02_file_size"
    t.datetime "gal_grffk02_updated_at"
    t.string   "cloud_asset02_url"
    t.string   "gal_grffk03_file_name"
    t.string   "gal_grffk03_content_type"
    t.integer  "gal_grffk03_file_size"
    t.datetime "gal_grffk03_updated_at"
    t.string   "cloud_asset03_url"
    t.string   "gal_grffk04_file_name"
    t.string   "gal_grffk04_content_type"
    t.integer  "gal_grffk04_file_size"
    t.datetime "gal_grffk04_updated_at"
    t.string   "cloud_asset04_url"
    t.string   "gal_grffk05_file_name"
    t.string   "gal_grffk05_content_type"
    t.integer  "gal_grffk05_file_size"
    t.datetime "gal_grffk05_updated_at"
    t.string   "cloud_asset05_url"
    t.string   "gal_grffk06_file_name"
    t.string   "gal_grffk06_content_type"
    t.integer  "gal_grffk06_file_size"
    t.datetime "gal_grffk06_updated_at"
    t.string   "cloud_asset06_url"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "product_sku_variants", ["product_id"], name: "index_product_sku_variants_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.integer  "ad_campaign_id"
    t.integer  "product_type"
    t.string   "grffk_file_name"
    t.string   "grffk_content_type"
    t.integer  "grffk_file_size"
    t.datetime "grffk_updated_at"
    t.string   "cloud_asset_url"
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "grffk_processing"
    t.string   "download_url"
  end

  add_index "products", ["ad_campaign_id", "created_at"], name: "index_products_on_ad_campaign_id_and_created_at", using: :btree
  add_index "products", ["ad_campaign_id"], name: "index_products_on_ad_campaign_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string "curr_ip"
    t.string "device_token"
    t.string "device_spec"
  end

end
