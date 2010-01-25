# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100125173217) do

  create_table "carcomments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "car_id"
    t.text     "body"
    t.integer  "reply_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carimages", :force => true do |t|
    t.integer  "car_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.integer  "ordinal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", :force => true do |t|
    t.string   "genre"
    t.string   "name"
    t.integer  "user_id"
    t.string   "make"
    t.string   "age_grade"
    t.string   "ccm"
    t.string   "performance"
    t.integer  "fuel"
    t.float    "acceleration"
    t.integer  "topspeed"
    t.float    "torque"
    t.string   "color"
    t.integer  "ordinal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "cars", ["user_id"], :name => "index_cars_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "body"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to"
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "last_topic_id"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topics_count"
    t.integer  "comments_count"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "friend_id",                   :null => false
    t.string   "status",     :default => "0", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "images", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "ordinal"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.integer  "hits"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_short_url"

  create_table "roles", :force => true do |t|
    t.string   "rolename",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["user_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id"

  create_table "rssnews", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "pub_date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rssreader_id"
    t.integer  "hits"
    t.string   "lang"
  end

  add_index "rssnews", ["pub_date"], :name => "index_rssnews_on_pub_date"

  create_table "rssreaders", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lang"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "title"
    t.integer  "hits"
    t.integer  "sticky"
    t.integer  "comments_count"
    t.boolean  "locked"
    t.datetime "replyed_at"
    t.integer  "replyed_by"
    t.integer  "last_comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                  :default => true
    t.integer  "nem"
    t.string   "country",                   :limit => 80
    t.string   "city",                      :limit => 80
    t.string   "name"
    t.datetime "birth"
    t.string   "zip",                       :limit => 16
    t.string   "address"
    t.string   "phone",                     :limit => 128
    t.string   "langs"
    t.string   "about"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "comments_count"
    t.datetime "last_login"
    t.integer  "usertype"
    t.string   "lang"
    t.string   "website"
    t.text     "nyitvatartas"
    t.text     "contact_person"
    t.text     "contact_phone"
    t.float    "lat"
    t.float    "lng"
    t.integer  "maximum_cars"
  end

  add_index "users", ["lat", "lng"], :name => "index_users_on_lat_and_lng"
  add_index "users", ["usertype"], :name => "index_users_on_type"

end
