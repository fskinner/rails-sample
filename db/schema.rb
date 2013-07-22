ActiveRecord::Schema.define(:version => 20130721231202) do

  create_table "consoles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "deliverers", :force => true do |t|
    t.datetime "date"
    t.boolean  "has_returned"
    t.integer  "rent_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "deliverers", ["rent_id"], :name => "index_deliverers_on_rent_id"

  create_table "devolutions", :force => true do |t|
    t.datetime "date"
    t.integer  "midia_status"
    t.boolean  "has_returned"
    t.integer  "rent_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "devolutions", ["rent_id"], :name => "index_devolutions_on_rent_id"

  create_table "game_samples", :force => true do |t|
    t.boolean  "available"
    t.string   "identifier"
    t.integer  "rent_id"
    t.integer  "devolution_id"
    t.integer  "game_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "game_samples", ["devolution_id"], :name => "index_game_samples_on_devolution_id"
  add_index "game_samples", ["game_id"], :name => "index_game_samples_on_game_id"
  add_index "game_samples", ["rent_id"], :name => "index_game_samples_on_rent_id"

  create_table "games", :force => true do |t|
    t.string   "name"
    t.integer  "console_id"
    t.integer  "gender_id"
    t.integer  "price_range_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "games", ["console_id"], :name => "index_games_on_console_id"
  add_index "games", ["gender_id"], :name => "index_games_on_gender_id"
  add_index "games", ["price_range_id"], :name => "index_games_on_price_range_id"

  create_table "genders", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "histories", :force => true do |t|
    t.float    "value"
    t.string   "transaction_type"
    t.string   "message"
    t.string   "currency"
    t.datetime "date"
    t.integer  "rent_id"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "histories", ["rent_id"], :name => "index_histories_on_rent_id"
  add_index "histories", ["user_id"], :name => "index_histories_on_user_id"

  create_table "payments", :force => true do |t|
    t.datetime "date"
    t.integer  "type"
    t.float    "value"
    t.integer  "rent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "price_ranges", :force => true do |t|
    t.float    "price"
    t.float    "decrement_value"
    t.string   "category"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "rents", :force => true do |t|
    t.datetime "date"
    t.float    "initial_value"
    t.float    "decrement_value"
    t.integer  "user_id"
    t.integer  "game_sample_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "rents", ["game_sample_id"], :name => "index_rents_on_game_sample_id"
  add_index "rents", ["user_id"], :name => "index_rents_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "bank"
    t.string   "agency"
    t.string   "account"
    t.string   "role"
    t.integer  "shopcredit",             :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
