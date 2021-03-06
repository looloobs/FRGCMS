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

ActiveRecord::Schema.define(:version => 20100227013046) do

  create_table "accounts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "battalion_id"
  end

  create_table "additionals", :force => true do |t|
    t.string   "relationship"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "cellphone"
    t.string   "addphone"
    t.string   "email"
    t.integer  "soldier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "battalion_id"
    t.integer  "company_id"
  end

  create_table "battalions", :force => true do |t|
    t.string   "unit"
    t.string   "name"
    t.string   "installation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "childrens", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "birth_date"
    t.integer  "soldier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.integer  "installation_id"
    t.integer  "battalion_id"
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "attached_id"
  end

  create_table "four_oh_fours", :force => true do |t|
    t.string   "url"
    t.string   "referer"
    t.integer  "count",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "four_oh_fours", ["url", "referer"], :name => "index_four_oh_fours_on_url_and_referer", :unique => true
  add_index "four_oh_fours", ["url"], :name => "index_four_oh_fours_on_url"

  create_table "invitations", :force => true do |t|
    t.integer  "sender_id"
    t.string   "email"
    t.string   "token"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["token"], :name => "index_invitations_on_token", :unique => true

  create_table "kids", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birth_date", :limit => 255
    t.integer  "soldier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "logged_exceptions", :force => true do |t|
    t.string   "exception_class"
    t.string   "controller_name"
    t.string   "action_name"
    t.text     "message"
    t.text     "backtrace"
    t.text     "environment"
    t.text     "request"
    t.datetime "created_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id"
    t.string   "to_email"
    t.string   "from_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bcc_email"
    t.string   "replyto"
    t.string   "cc_mail"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "notes", :force => true do |t|
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id"
    t.string   "to_email"
    t.string   "from_email"
    t.string   "bcc_email"
    t.string   "replyto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "platoons", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "battalion_id"
    t.integer  "attached_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "primaries", :force => true do |t|
    t.string   "relationship"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.date     "birth_date",       :limit => 255
    t.string   "cellphone"
    t.string   "cellphonecarrier"
    t.boolean  "sms"
    t.string   "addphone"
    t.string   "email"
    t.integer  "soldier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "battalion_id"
    t.integer  "company_id"
    t.string   "contacted"
  end

  create_table "roles", :force => true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "soldiers", :force => true do |t|
    t.integer  "battalion_id"
    t.integer  "company_id"
    t.string   "rank"
    t.string   "maritalstatus"
    t.string   "firstname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "cellphone"
    t.string   "addphone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lastname"
    t.string   "cellphonecarrier"
    t.date     "birth_date",       :limit => 255
    t.date     "anni_date",        :limit => 255
    t.boolean  "sms"
    t.string   "address2"
    t.string   "seniorleader"
    t.string   "pregnant"
    t.date     "duedate"
    t.integer  "platoon_id"
    t.string   "four"
  end

  create_table "user_failures", :force => true do |t|
    t.string   "remote_ip"
    t.string   "http_user_agent"
    t.string   "failure_type"
    t.string   "username"
    t.integer  "count",           :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_failures", ["remote_ip"], :name => "index_user_failures_on_remote_ip"

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "user_type"
    t.string   "login",                         :limit => 40
    t.string   "name",                          :limit => 100, :default => ""
    t.string   "email",                         :limit => 100
    t.string   "crypted_password",              :limit => 128, :default => "",   :null => false
    t.string   "password_salt",                 :limit => 128, :default => "",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "old_remember_token",            :limit => 40
    t.datetime "old_remember_token_expires_at"
    t.string   "old_activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "old_password_reset_code",       :limit => 40
    t.boolean  "enabled",                                      :default => true
    t.string   "identity_url"
    t.integer  "invitation_id"
    t.integer  "invitation_limit"
    t.string   "position"
    t.integer  "battalion_id"
    t.integer  "company_id"
    t.integer  "soldier_id"
    t.integer  "login_count",                                  :default => 0,    :null => false
    t.integer  "failed_login_count",                           :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.boolean  "active"
    t.integer  "platoon_id"
    t.string   "role"
    t.text     "signature"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

  create_table "users_messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

end
