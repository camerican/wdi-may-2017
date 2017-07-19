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

ActiveRecord::Schema.define(version: 20170719150329) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "dob"
    t.datetime "dod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artwork_keywords", id: false, force: :cascade do |t|
    t.integer "artwork_id"
    t.integer "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_artwork_keywords_on_artwork_id"
    t.index ["keyword_id"], name: "index_artwork_keywords_on_keyword_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "name"
    t.integer "artist_id"
    t.datetime "completed_at"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artworks_on_artist_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
