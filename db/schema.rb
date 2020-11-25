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

ActiveRecord::Schema.define(version: 2020_11_16_084930) do

  create_table "post_food_comments", force: :cascade do |t|
    t.float "rate"
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "post_food_id"
  end

  create_table "post_food_favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "post_food_id"
  end

  create_table "post_foods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rate", default: 0.0, null: false
    t.string "name", null: false
    t.text "explanation", null: false
    t.string "image_id", null: false
    t.text "reference_site_url", null: false
    t.integer "time", default: 0, null: false
    t.integer "genre", default: 0, null: false
    t.integer "cost", default: 0, null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.integer "sex", default: 0, null: false
    t.integer "age", default: 0, null: false
    t.string "image_id", default: "", null: false
    t.text "introduction", default: "", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
