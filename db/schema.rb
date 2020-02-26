# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_24_155546) do

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "confirmation"
    t.integer "space_id"
    t.integer "user_id"
    t.index ["space_id"], name: "index_bookings_on_space_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "property_name"
    t.text "description"
    t.integer "price"
    t.integer "user_id"
    t.index ["user_id"], name: "index_spaces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

  add_foreign_key "bookings", "spaces"
  add_foreign_key "bookings", "users"
  add_foreign_key "spaces", "users"
end
