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

ActiveRecord::Schema.define(version: 20150328161136) do

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

  create_table "badges_sashes", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.text     "body"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "anchors_count", default: 0
  end

  add_index "experiences", ["location_id"], name: "index_experiences_on_location_id", using: :btree
  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "guides", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guides", ["user_id"], name: "index_guides_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "file"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "anchors_count", default: 0
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

  create_table "merit_actions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pages", ["guide_id"], name: "index_pages_on_guide_id", using: :btree
  add_index "pages", ["location_id"], name: "index_pages_on_location_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: :cascade do |t|
    t.integer  "location_id"
    t.decimal  "lat"
    t.string   "latd"
    t.decimal  "long"
    t.string   "longd"
    t.text     "description"
    t.boolean  "fuel"
    t.integer  "slips"
    t.integer  "moorings"
    t.string   "protection"
    t.string   "ltype",       default: "Destination"
    t.string   "cost"
    t.integer  "pstart"
    t.integer  "pend"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "stats", ["location_id"], name: "index_stats_on_location_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.string   "fname",                  default: "",    null: false
    t.string   "lname",                  default: "",    null: false
    t.string   "image"
    t.string   "blog"
    t.string   "location",               default: "",    null: false
    t.text     "bio",                    default: "",    null: false
    t.string   "boatname",               default: "",    null: false
    t.string   "boatmodel",              default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sash_id"
    t.integer  "level",                  default: 0
    t.string   "provider"
    t.string   "uid"
    t.boolean  "banned",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "experiences", "locations"
  add_foreign_key "experiences", "users"
  add_foreign_key "guides", "users"
  add_foreign_key "images", "locations"
  add_foreign_key "images", "users"
  add_foreign_key "pages", "guides"
  add_foreign_key "pages", "locations"
  add_foreign_key "stats", "locations"
end
