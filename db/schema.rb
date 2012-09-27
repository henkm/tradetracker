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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120926090830) do

  create_table "affiliates", :force => true do |t|
    t.string   "name"
    t.integer  "tradetracker_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "banner_productfeeds", :force => true do |t|
    t.integer  "banner_id"
    t.integer  "productfeed_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "banner_productfeeds", ["banner_id"], :name => "index_banner_productfeeds_on_banner_id"
  add_index "banner_productfeeds", ["productfeed_id"], :name => "index_banner_productfeeds_on_productfeed_id"

  create_table "banners", :force => true do |t|
    t.integer  "affiliate_id"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "style"
    t.text     "custom_css"
    t.boolean  "show_image"
    t.integer  "max_text_size"
  end

  create_table "productfeeds", :force => true do |t|
    t.string   "xml_url"
    t.string   "title_field"
    t.string   "description_field"
    t.string   "url_field"
    t.string   "link_text"
    t.string   "byline_field"
    t.string   "old_price_field"
    t.string   "new_price_field"
    t.string   "image_field"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "original_id_field"
    t.string   "original_id_attribute"
    t.string   "url_attribute"
    t.string   "byline_attribute"
    t.string   "old_price_attribute"
    t.string   "new_price_attribute"
    t.string   "image_attribute"
    t.string   "extra_info1_field"
    t.string   "extra_info1_attribute"
    t.string   "extra_info2_field"
    t.string   "extra_info2_attribute"
    t.string   "extra_info1_name"
    t.string   "extra_info2_name"
    t.string   "extra_info1_type"
    t.string   "extra_info2_type"
    t.string   "extra_info3_field"
    t.string   "extra_info3_attribute"
    t.string   "extra_info3_name"
    t.string   "extra_info3_type"
    t.string   "name"
    t.string   "update_version"
    t.string   "currency_field"
    t.string   "currency_attribute"
    t.string   "extra_info1_value"
    t.string   "extra_info2_value"
    t.string   "extra_info3_value"
    t.string   "image_value"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "byline"
    t.string   "image"
    t.string   "old_price"
    t.string   "new_price"
    t.string   "dna"
    t.string   "url"
    t.text     "description"
    t.integer  "productfeed_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "original_id"
    t.string   "extra_info1"
    t.string   "extra_info2"
    t.string   "extra_info3"
    t.string   "update_version"
    t.string   "currency"
  end

  add_index "products", ["original_id"], :name => "index_products_on_original_id"
  add_index "products", ["productfeed_id", "update_version"], :name => "index_products_on_productfeed_id_and_update_version"
  add_index "products", ["productfeed_id"], :name => "index_products_on_productfeed_id"

end
