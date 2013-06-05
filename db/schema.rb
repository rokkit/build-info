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

ActiveRecord::Schema.define(:version => 20130605074057) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.integer  "country_id"
    t.integer  "region_id"
    t.integer  "city_id"
    t.integer  "distinct_id"
    t.integer  "street_id"
    t.string   "number_house"
    t.string   "number_korp"
    t.string   "minibus"
    t.string   "bus"
    t.string   "trolleybus"
    t.string   "railsbus"
    t.integer  "metro_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "build_object_id"
  end

  add_index "addresses", ["city_id"], :name => "index_addresses_on_city_id"
  add_index "addresses", ["country_id"], :name => "index_addresses_on_country_id"
  add_index "addresses", ["distinct_id"], :name => "index_addresses_on_distinct_id"
  add_index "addresses", ["region_id"], :name => "index_addresses_on_region_id"
  add_index "addresses", ["street_id"], :name => "index_addresses_on_street_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "appartements", :force => true do |t|
    t.integer  "floor"
    t.integer  "rooms"
    t.float    "area"
    t.float    "living_area"
    t.float    "kitchen_area"
    t.integer  "planning_id"
    t.float    "hfloor"
    t.integer  "toilet_id"
    t.integer  "remont_id"
    t.boolean  "balkon"
    t.integer  "hotwater_id"
    t.integer  "view_from_windows_id"
    t.integer  "house_id"
    t.integer  "terms_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "appartements", ["hotwater_id"], :name => "index_appartements_on_hotwater_id"
  add_index "appartements", ["house_id"], :name => "index_appartements_on_house_id"
  add_index "appartements", ["planning_id"], :name => "index_appartements_on_planning_id"
  add_index "appartements", ["remont_id"], :name => "index_appartements_on_remont_id"
  add_index "appartements", ["terms_id"], :name => "index_appartements_on_terms_id"
  add_index "appartements", ["toilet_id"], :name => "index_appartements_on_toilet_id"
  add_index "appartements", ["view_from_windows_id"], :name => "index_appartements_on_view_from_windows_id"

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "user_id"
    t.boolean  "published"
    t.integer  "category_article_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "rating"
  end

  add_index "articles", ["category_article_id"], :name => "index_articles_on_category_article_id"
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "basements", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "build_objects", :force => true do |t|
    t.string   "type"
    t.decimal  "price"
    t.integer  "user_id"
    t.integer  "type_of_build_object_id"
    t.integer  "type_of_house_id"
    t.date     "byear"
    t.boolean  "overhault"
    t.integer  "material_id"
    t.integer  "overlap_id"
    t.boolean  "elevator"
    t.boolean  "chute"
    t.boolean  "consierge"
    t.integer  "stair_id"
    t.integer  "basement_id"
    t.float    "hfirstfloor"
    t.string   "name"
    t.string   "builder"
    t.string   "shopprod"
    t.string   "domesticserv"
    t.string   "shopping"
    t.string   "phrmacy"
    t.string   "clinic"
    t.string   "kgarten"
    t.string   "school"
    t.string   "bank"
    t.string   "parking"
    t.string   "park"
    t.string   "busstop"
    t.integer  "terms_id"
    t.integer  "floor"
    t.integer  "rooms"
    t.float    "area"
    t.float    "living_area"
    t.float    "kitchen_area"
    t.integer  "planning_id"
    t.float    "hfloor"
    t.integer  "toilet_id"
    t.integer  "remont_id"
    t.boolean  "balkon"
    t.integer  "hotwater_id"
    t.integer  "view_from_windows_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "rating"
    t.boolean  "ipoteka"
    t.integer  "valute_id"
  end

  create_table "category_articles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["region_id"], :name => "index_cities_on_region_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "distincts", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "distincts", ["city_id"], :name => "index_distincts_on_city_id"

  create_table "hotwaters", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "houses", :force => true do |t|
    t.integer  "type_of_house_id"
    t.date     "byear"
    t.boolean  "overhault"
    t.integer  "material_id"
    t.integer  "overlap_id"
    t.boolean  "elevator"
    t.boolean  "chute"
    t.boolean  "consierge"
    t.integer  "stair_id"
    t.integer  "basement_id"
    t.float    "hfirstfloor"
    t.string   "name"
    t.string   "builder"
    t.integer  "user_id"
    t.string   "shopprod"
    t.string   "domesticserv"
    t.string   "shopping"
    t.string   "phrmacy"
    t.string   "clinic"
    t.string   "kgarten"
    t.string   "school"
    t.string   "bank"
    t.string   "parking"
    t.string   "park"
    t.string   "busstop"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "address_id"
    t.integer  "terms_id"
    t.decimal  "price"
  end

  add_index "houses", ["basement_id"], :name => "index_houses_on_basement_id"
  add_index "houses", ["material_id"], :name => "index_houses_on_material_id"
  add_index "houses", ["overlap_id"], :name => "index_houses_on_overlap_id"
  add_index "houses", ["stair_id"], :name => "index_houses_on_stair_id"
  add_index "houses", ["type_of_house_id"], :name => "index_houses_on_type_of_house_id"
  add_index "houses", ["user_id"], :name => "index_houses_on_user_id"

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "metros", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news", ["user_id"], :name => "index_news_on_user_id"

  create_table "overlaps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "image"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "build_object_id"
  end

  create_table "plannings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "regions", ["country_id"], :name => "index_regions_on_country_id"

  create_table "remonts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "stairs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "streets", :force => true do |t|
    t.string   "name"
    t.integer  "distinct_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "streets", ["distinct_id"], :name => "index_streets_on_distinct_id"

  create_table "terms", :force => true do |t|
    t.decimal  "price"
    t.integer  "valute_id"
    t.boolean  "ipoteka"
    t.text     "desciption"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "terms", ["valute_id"], :name => "index_terms_on_valute_id"

  create_table "toilets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_of_build_objects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_of_houses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "rating"
    t.string   "fio"
    t.string   "phone"
    t.string   "name"
    t.integer  "type_user_id"
    t.integer  "user_id"
    t.integer  "language_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "valutes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "view_from_windows", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
