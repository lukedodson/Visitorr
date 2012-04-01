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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20120331162542) do
=======
ActiveRecord::Schema.define(:version => 20120107002653) do
>>>>>>> 7a4ccab5396bf9fe976c1459f694de75029476f5

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "email_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "address"
    t.string   "phone"
    t.string   "video_url"
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.string   "question_one"
    t.string   "question_two"
    t.string   "question_three"
    t.string   "question_four"
    t.string   "question_five"
=======
>>>>>>> 7a4ccab5396bf9fe976c1459f694de75029476f5
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                              :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "slug"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "video"
    t.string   "last_4_digits"
    t.string   "stripe_id"
    t.boolean  "subscribed",                      :default => false
    t.string   "subject"
    t.text     "email_body"
    t.string   "stripe_customer_token"
    t.string   "paypal_customer_token"
    t.string   "paypal_recurring_profile_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "plan_id"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

  create_table "visitors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "welcomed",   :default => false
  end

end
