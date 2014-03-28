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

ActiveRecord::Schema.define(version: 20140328052724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "img"
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "img"
    t.string   "phone"
    t.string   "email"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.decimal  "credits",    default: 0.0
    t.string   "starch",     default: "none"
  end

  add_index "customers", ["first_name", "last_name", "phone", "email"], name: "index_customers_on_first_name_and_last_name_and_phone_and_email", using: :btree
  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "quantity",   default: 1
    t.decimal  "price"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_price",  default: 0.0
    t.string   "payment_type", default: "none"
    t.string   "tag_number",   default: "add tag number"
    t.boolean  "racked",       default: false
    t.decimal  "credits_used", default: 0.0
    t.datetime "pickup_date",  default: '2014-03-28 00:00:00'
    t.boolean  "picked_up",    default: false
    t.string   "rack_number",  default: "add rack number"
    t.string   "order_number"
  end

  add_index "orders", ["order_number"], name: "index_orders_on_order_number", using: :btree
  add_index "orders", ["racked"], name: "index_orders_on_racked", using: :btree
  add_index "orders", ["tag_number"], name: "index_orders_on_tag_number", using: :btree
  add_index "orders", ["user_id", "customer_id"], name: "index_orders_on_user_id_and_customer_id", using: :btree

  create_table "static_pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "img"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.integer  "turnaround_time"
    t.string   "business_hours"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
