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

ActiveRecord::Schema[8.1].define(version: 2026_07_05_205557) do
  create_table "beer_hops", force: :cascade do |t|
    t.integer "beer_id", null: false
    t.datetime "created_at", null: false
    t.integer "hop_id", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_beer_hops_on_beer_id"
    t.index ["hop_id"], name: "index_beer_hops_on_hop_id"
  end

  create_table "beers", force: :cascade do |t|
    t.decimal "abv"
    t.integer "brewery_id", null: false
    t.datetime "created_at", null: false
    t.integer "ibu"
    t.string "name"
    t.integer "style_id", null: false
    t.datetime "updated_at", null: false
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
    t.index ["style_id"], name: "index_beers_on_style_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "brewery_type"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "name"
    t.string "state_province"
    t.datetime "updated_at", null: false
    t.string "website_url"
  end

  create_table "hops", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "beer_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["beer_id"], name: "index_reviews_on_beer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "beer_hops", "beers"
  add_foreign_key "beer_hops", "hops"
  add_foreign_key "beers", "breweries"
  add_foreign_key "beers", "styles"
  add_foreign_key "reviews", "beers"
  add_foreign_key "reviews", "users"
end
