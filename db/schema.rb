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

ActiveRecord::Schema.define(version: 2018_11_03_043906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animes", force: :cascade do |t|
    t.string "slug"
    t.text "synopsis"
    t.string "title"
    t.string "averageRating"
    t.integer "userCount"
    t.integer "favoritesCount"
    t.date "startDate"
    t.date "endDate"
    t.integer "popularityRank"
    t.integer "ratingRank"
    t.string "ageRatingGuide"
    t.string "coverImage"
    t.string "status"
    t.string "subtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
