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

ActiveRecord::Schema.define(version: 2023_08_23_230338) do

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.datetime "showtimes"
    t.string "screening_title"
    t.text "description"
    t.text "legacy_credit_text"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "print_source"
    t.datetime "datetime_one"
    t.datetime "datetime_two"
  end

  create_table "people", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "etc_name"
    t.string "display_name"
    t.string "birth_date"
    t.string "death_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relations", force: :cascade do |t|
    t.string "relation_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
    t.integer "event_id"
    t.integer "series_id"
    t.integer "work_id"
    t.index ["event_id"], name: "index_relations_on_event_id"
    t.index ["person_id"], name: "index_relations_on_person_id"
    t.index ["series_id"], name: "index_relations_on_series_id"
    t.index ["work_id"], name: "index_relations_on_work_id"
  end

  create_table "series", force: :cascade do |t|
    t.datetime "series_start_date"
    t.datetime "series_end_date"
    t.string "series_type"
    t.string "series_title"
    t.text "series_description"
    t.text "series_credits"
    t.text "series_short_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "exhibition_number"
    t.string "catalog_notes"
    t.string "brochure_notes"
    t.string "tour_notes"
    t.string "outside_organizer"
    t.string "location"
    t.string "artist_list"
  end

  create_table "works", force: :cascade do |t|
    t.datetime "year"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "AddCountryToWorks"
    t.string "country"
    t.string "alt_title"
  end

end
