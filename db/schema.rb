# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_17_213201) do

  create_table "hikes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "mountain_id"
    t.integer "rating", default: 0
    t.string "comment"
    t.date "date_hiked"
    t.integer "percent_hiked", default: 100
    t.integer "total_distance", default: 0
    t.integer "total_elevation_gain", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mountains", force: :cascade do |t|
    t.integer "base_elevation"
    t.integer "summit_elevation"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "directions_url"
    t.integer "hike_distance"
    t.boolean "saved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reserves", force: :cascade do |t|
    t.integer "mountain_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "total_elevation", default: 0
    t.float "total_distance", default: 0.0
    t.boolean "admin", default: false
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
