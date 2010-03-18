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

ActiveRecord::Schema.define(:version => 20100318150149) do

  create_table "adverts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.string   "method"
    t.string   "condition"
    t.string   "transfer"
  end

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
    t.integer  "advert_id"
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
    t.text     "interior"
    t.text     "exterior"
    t.decimal  "rating_average",    :precision => 6, :scale => 2, :default => 0.0
    t.boolean  "for_sale"
    t.integer  "tournament_win"
    t.integer  "tournament_lost"
    t.integer  "combat_win"
    t.integer  "combat_lost"
    t.integer  "price"
    t.integer  "km"
    t.string   "km_unit"
    t.integer  "condition"
    t.string   "price_unit"
    t.string   "performance_unit"
    t.integer  "month"
    t.string   "acceleration_unit"
  end

  add_index "cars", ["user_id"], :name => "index_cars_on_user_id"

  create_table "clubs", :force => true do |t|
    t.string   "name"
    t.string   "short_description"
    t.string   "description"
    t.string   "type"
    t.integer  "owner_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public"
  end

  create_table "combat_votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "combat_id"
    t.integer  "voted_car"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "combats", :force => true do |t|
    t.integer  "challenger_id"
    t.integer  "invited_id"
    t.string   "status"
    t.string   "message"
    t.integer  "challenger_rate"
    t.integer  "invited_rate"
    t.integer  "winner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "body"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to"
  end

  create_table "cups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "car_id"
    t.string   "style"
    t.string   "description"
    t.integer  "opponent_car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", :force => true do |t|
    t.integer  "car_id"
    t.boolean  "fuggonylegzsak"
    t.boolean  "hatsooldallegzsak"
    t.boolean  "hatsolegzsak"
    t.boolean  "utaslegzsak"
    t.boolean  "im"
    t.boolean  "legzsakoff"
    t.boolean  "vezetolegzsak"
    t.boolean  "oldallegzsak"
    t.boolean  "nincsforgalmi"
    t.boolean  "csamaghalo"
    t.boolean  "tolatoradar"
    t.boolean  "faberakas"
    t.boolean  "bukocso"
    t.boolean  "alufelni"
    t.boolean  "hasznaltauto_beszamitas"
    t.boolean  "torzskonyv"
    t.boolean  "pluss_karpit"
    t.boolean  "kulfoldi_papirok"
    t.boolean  "karbantartott"
    t.boolean  "isof"
    t.boolean  "full"
    t.boolean  "led"
    t.boolean  "xen"
    t.boolean  "gps"
    t.boolean  "dvd"
    t.boolean  "cd"
    t.boolean  "comp"
    t.boolean  "esp"
    t.boolean  "asr"
    t.boolean  "abs"
    t.boolean  "tempomat"
    t.boolean  "vonohorog"
    t.boolean  "szinezettuveg"
    t.boolean  "kevesetfutott"
    t.boolean  "automatavalto"
    t.boolean  "allithatokormany"
    t.boolean  "szervo"
    t.boolean  "manualisvalto"
    t.boolean  "ulesmemoria"
    t.boolean  "allithato_hatso_ules"
    t.boolean  "allithato_ulesmagassag"
    t.boolean  "donthetoules"
    t.boolean  "napfenyteto"
    t.boolean  "elektromosteto"
    t.boolean  "el_ablak_elolhatul"
    t.boolean  "riaszto"
    t.boolean  "elektromos_ablak"
    t.boolean  "borbelso"
    t.boolean  "osszkerek"
    t.boolean  "futheto_tukor"
    t.boolean  "elektromos_tukor"
    t.boolean  "centralzar"
    t.boolean  "nemdohanyzo"
    t.boolean  "szervizkonyv"
    t.boolean  "taxi"
    t.boolean  "elsotulaj"
    t.boolean  "holgytulaj"
    t.boolean  "masodiktulaj"
    t.boolean  "garancialis"
    t.boolean  "kodlampa"
    t.boolean  "szinesuveg"
    t.boolean  "cdtar"
    t.boolean  "garazsbantartott"
    t.boolean  "radiosmagno"
    t.boolean  "automataklima"
    t.boolean  "manualklima"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.string   "favorable_type", :limit => 30
    t.integer  "favorable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "startdate"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "club_id"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "club_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sender_id"
    t.string   "status"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "rates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars"
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id"], :name => "index_rates_on_rateable_id"
  add_index "rates", ["user_id"], :name => "index_rates_on_user_id"

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

  create_table "shouts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

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

  create_table "userevents", :force => true do |t|
    t.integer  "user_id"
    t.string   "message"
    t.integer  "reply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "videos", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "hits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
