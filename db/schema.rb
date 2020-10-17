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

ActiveRecord::Schema.define(version: 2020_10_17_190956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pet_apps_id"
    t.bigint "user_id"
    t.index ["pet_apps_id"], name: "index_apps_on_pet_apps_id"
    t.index ["user_id"], name: "index_apps_on_user_id"
  end

  create_table "pet_apps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pet_id"
    t.bigint "app_id"
    t.index ["app_id"], name: "index_pet_apps_on_app_id"
    t.index ["pet_id"], name: "index_pet_apps_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "image", default: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Comic_image_missing.svg/1200px-Comic_image_missing.svg.png"
    t.string "name", default: "Not Provided"
    t.string "description", default: "Not Provided"
    t.integer "age", default: 0
    t.string "sex", default: "Not Provided"
    t.string "status", default: "Available"
    t.bigint "shelter_id"
    t.bigint "pet_apps_id"
    t.index ["pet_apps_id"], name: "index_pets_on_pet_apps_id"
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.float "rating"
    t.string "content"
    t.string "pic", default: "https://www.computerhope.com/jargon/g/guest-user.jpg"
    t.string "user_name"
    t.bigint "shelter_id"
    t.bigint "user_id"
    t.index ["shelter_id"], name: "index_reviews_on_shelter_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
  end

  add_foreign_key "apps", "pet_apps", column: "pet_apps_id"
  add_foreign_key "apps", "users"
  add_foreign_key "pet_apps", "apps"
  add_foreign_key "pet_apps", "pets"
  add_foreign_key "pets", "pet_apps", column: "pet_apps_id"
  add_foreign_key "pets", "shelters"
  add_foreign_key "reviews", "shelters"
  add_foreign_key "reviews", "users"
end
