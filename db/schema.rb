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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_08_01_193040) do
=======
ActiveRecord::Schema.define(version: 2018_08_01_173233) do
>>>>>>> 251c1effdfb309e6f859032012573580c721b85a

  create_table "ethnicities", force: :cascade do |t|
    t.string "type"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentage"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partnerships", force: :cascade do |t|
    t.integer "person_id"
    t.integer "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.date "dod"
    t.boolean "deceased"
    t.string "gender"
    t.string "place_of_birth"
    t.string "current_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "family_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.integer "family_id"
    t.string "photo_type"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "child_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
