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

ActiveRecord::Schema.define(version: 20180801120153) do

  create_table "favorite_spots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_favorite_spots_on_spot_id", using: :btree
    t.index ["user_id", "spot_id", "type"], name: "index_favorite_spots_on_user_id_and_spot_id_and_type", unique: true, using: :btree
    t.index ["user_id"], name: "index_favorite_spots_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.string   "image"
    t.string   "title"
    t.string   "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_reviews_on_spot_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "spot_photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "spot_id"
    t.string   "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_spot_photos_on_spot_id", using: :btree
  end

  create_table "spot_weekdays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "spot_id"
    t.text     "weekday_text", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["spot_id"], name: "index_spot_weekdays_on_spot_id", using: :btree
  end

  create_table "spots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "place_id"
    t.string   "formatted_address"
    t.string   "name"
    t.string   "photo_reference"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "weekday_text"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "favorite_spots", "spots"
  add_foreign_key "favorite_spots", "users"
  add_foreign_key "reviews", "spots"
  add_foreign_key "reviews", "users"
  add_foreign_key "spot_photos", "spots"
  add_foreign_key "spot_weekdays", "spots"
end
