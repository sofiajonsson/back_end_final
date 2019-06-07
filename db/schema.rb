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

ActiveRecord::Schema.define(version: 2019_06_06_185133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "weekly_forecast_id"
    t.integer "snowreport_id"
    t.integer "resorts_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resorts", force: :cascade do |t|
    t.string "title"
    t.string "img"
    t.string "elevation_gain"
    t.string "skiiable_terrain"
    t.string "beginner"
    t.string "intermediate"
    t.string "expert"
    t.string "total_lifts"
    t.string "ticket_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snow_reports", force: :cascade do |t|
    t.string "title"
    t.string "elevation"
    t.string "status"
    t.string "depth"
    t.string "slopes"
    t.string "lifts"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_names", force: :cascade do |t|
    t.datetime "date_of_review"
    t.integer "rating"
    t.string "title"
    t.string "description"
    t.integer "age"
    t.string "rider_type"
    t.integer "user_id"
    t.string "resort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "home_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_forecasts", force: :cascade do |t|
    t.string "title"
    t.string "today"
    t.string "tomorrow"
    t.string "day3"
    t.string "day4"
    t.string "day5"
    t.string "day6"
    t.string "day7"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
