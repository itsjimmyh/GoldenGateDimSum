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

ActiveRecord::Schema.define(version: 20150414071043) do

  create_table "images", force: :cascade do |t|
    t.integer "menu_item_id",                                        null: false
    t.string  "filepicker_url", default: "defaults/defaultfood.png", null: false
  end

  add_index "images", ["menu_item_id"], name: "index_images_on_menu_item_id"

  create_table "menu_items", force: :cascade do |t|
    t.string   "name",                                     null: false
    t.text     "description", default: "Item Description", null: false
    t.float    "price",                                    null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "menu_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "taggings", ["menu_item_id"], name: "index_taggings_on_menu_item_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                      null: false
    t.string   "encrypted_password",     default: "",                      null: false
    t.string   "first_name",             default: "Your First Name",       null: false
    t.string   "last_name",              default: "Your Last Name",        null: false
    t.string   "nickname",               default: "Your Nickname"
    t.string   "delivery_address",       default: "Your Delivery Address"
    t.string   "apartment",              default: "Your Apt #"
    t.string   "city",                   default: "Your City"
    t.integer  "zip",                    default: 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
