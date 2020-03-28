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

ActiveRecord::Schema.define(version: 20200327202438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flash_infos", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.integer "active"
    t.integer "created_int"
    t.integer "updated_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.integer "cases"
    t.integer "deaths"
    t.integer "recovered"
    t.integer "created_uid"
    t.integer "updated_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "text"
    t.integer "created_uid"
    t.integer "updated_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "created_uid"
    t.integer "updated_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.string "reference"
    t.text "text"
    t.string "status"
    t.string "type_request"
    t.integer "created_uid"
    t.integer "updated_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.string "email"
    t.string "password"
    t.integer "active"
    t.bigint "profile_id"
    t.integer "terms"
    t.integer "is_admin"
    t.integer "created_uid"
    t.integer "updated_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_users_on_profile_id"
  end

  add_foreign_key "messages", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "users", "profiles"
end
