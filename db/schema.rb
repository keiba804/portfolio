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

ActiveRecord::Schema.define(version: 2020_04_27_102653) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_categories", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "menu_category_name"
    t.integer "active_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.integer "menu_category_id"
    t.string "menu_name"
    t.string "explanation"
    t.string "price"
    t.string "takeout"
    t.string "sales_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "restaurant_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "post_title"
    t.string "post_body"
    t.integer "post_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_images", force: :cascade do |t|
    t.integer "admin_id"
    t.string "restaurant_image_title"
    t.string "restaurant_image_body"
    t.integer "restaurant_post_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "admin_name_kana"
    t.string "restaurant_name"
    t.integer "genre"
    t.string "restaurant_phone_number"
    t.string "restaurant_adress"
    t.string "access"
    t.string "regular_holiday"
    t.string "charge"
    t.string "payment"
    t.string "introduce_title"
    t.text "introduce_body"
    t.integer "restaurant_top_image"
    t.integer "restaurant_status", default: 0
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admin_name_kanji"
    t.index ["email"], name: "index_restaurants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_restaurants_on_reset_password_token", unique: true
  end

  create_table "user_post_images", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_id"
    t.string "user_image_title"
    t.integer "user_post_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name_kanji"
    t.string "name_kana"
    t.string "nickname"
    t.string "user_phone_number"
    t.integer "profile_status", default: 0
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
