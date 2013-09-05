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

ActiveRecord::Schema.define(:version => 20130905060131) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "journals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "medication_id"
    t.integer  "timeperiod_id"
    t.datetime "date_due"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "dosage"
    t.integer  "parent_id"
    t.datetime "date_taken"
    t.datetime "next_due"
  end

  create_table "medications", :force => true do |t|
    t.string   "medication_name"
    t.integer  "stock_quantity"
    t.datetime "expiry_date"
    t.string   "directions"
    t.string   "notes"
    t.boolean  "archive"
    t.integer  "medication_type_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "medicationtypes", :force => true do |t|
    t.string   "medication_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "rosters", :force => true do |t|
    t.datetime "starting_date"
    t.datetime "ending_date"
    t.datetime "last_taken"
    t.integer  "user_id"
    t.integer  "medication_id"
    t.integer  "group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "frequency"
    t.integer  "dosage"
  end

  create_table "schedules", :force => true do |t|
    t.text     "schedule_rule"
    t.datetime "next_occurrence"
    t.integer  "user_id"
    t.integer  "medication_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.datetime "previous_occurrence"
    t.integer  "dosage"
  end

  create_table "timeperiodnames", :force => true do |t|
    t.text     "time_period_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "timeperiods", :force => true do |t|
    t.text     "timeperiodname_id"
    t.datetime "time_of_day"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_phone"
    t.boolean  "mobile_phone_notification"
    t.boolean  "email_notification"
    t.string   "email",                     :default => "", :null => false
    t.string   "encrypted_password",        :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
