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

ActiveRecord::Schema.define(version: 20180808035612) do

  create_table "evas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "res_review_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["res_review_id"], name: "index_evas_on_res_review_id", using: :btree
    t.index ["user_id", "res_review_id"], name: "index_evas_on_user_id_and_res_review_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_evas_on_user_id", using: :btree
  end

  create_table "favorite_restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_favorite_restaurants_on_restaurant_id", using: :btree
    t.index ["user_id", "restaurant_id", "type"], name: "index_favorite_restaurants_on_user_id_and_restaurant_id_and_type", unique: true, using: :btree
    t.index ["user_id"], name: "index_favorite_restaurants_on_user_id", using: :btree
  end

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

  create_table "refs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_refs_on_review_id", using: :btree
    t.index ["user_id", "review_id"], name: "index_refs_on_user_id_and_review_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_refs_on_user_id", using: :btree
  end

  create_table "res_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.string   "image"
    t.string   "title"
    t.text     "review",        limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["restaurant_id"], name: "index_res_reviews_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_res_reviews_on_user_id", using: :btree
  end

  create_table "restaurant_photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "restaurant_id"
    t.string   "photo_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_restaurant_photos_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "place_id"
    t.string   "formatted_address"
    t.string   "name"
    t.string   "photo_reference"
    t.string   "weekday_text"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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

  add_foreign_key "evas", "res_reviews"
  add_foreign_key "evas", "users"
  add_foreign_key "favorite_restaurants", "restaurants"
  add_foreign_key "favorite_restaurants", "users"
  add_foreign_key "favorite_spots", "spots"
  add_foreign_key "favorite_spots", "users"
  add_foreign_key "refs", "reviews"
  add_foreign_key "refs", "users"
  add_foreign_key "res_reviews", "restaurants"
  add_foreign_key "res_reviews", "users"
  add_foreign_key "restaurant_photos", "restaurants"
  add_foreign_key "reviews", "spots"
  add_foreign_key "reviews", "users"
  add_foreign_key "spot_photos", "spots"
  add_foreign_key "spot_weekdays", "spots"
end
