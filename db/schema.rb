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

ActiveRecord::Schema.define(version: 20150318161649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anchors", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "anchorable_id"
    t.string   "anchorable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "anchors", ["anchorable_type", "anchorable_id"], name: "index_anchors_on_anchorable_type_and_anchorable_id", using: :btree
  add_index "anchors", ["user_id"], name: "index_anchors_on_user_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "experiences", ["location_id"], name: "index_experiences_on_location_id", using: :btree
  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "file"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "images", ["location_id"], name: "index_images_on_location_id", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_regions", id: false, force: :cascade do |t|
    t.integer "location_id"
    t.integer "region_id"
  end

  add_index "locations_regions", ["location_id"], name: "index_locations_regions_on_location_id", using: :btree
  add_index "locations_regions", ["region_id"], name: "index_locations_regions_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.string   "fname"
    t.string   "lname"
    t.string   "image"
    t.string   "location"
    t.text     "bio"
    t.string   "boatname"
    t.string   "boatmodel"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "experiences", "locations"
  add_foreign_key "experiences", "users"
  add_foreign_key "images", "locations"
  add_foreign_key "images", "users"
end
