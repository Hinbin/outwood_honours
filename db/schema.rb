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

ActiveRecord::Schema.define(version: 2019_06_18_114832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awarders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "badges", force: :cascade do |t|
    t.string "name", null: false
    t.integer "external_id", null: false
    t.bigint "category_id"
    t.bigint "awarder_id"
    t.string "criteria"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["awarder_id"], name: "index_badges_on_awarder_id"
    t.index ["category_id"], name: "index_badges_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "required_badges", force: :cascade do |t|
    t.integer "badge_id"
    t.integer "required_badge_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id", "required_badge_id"], name: "index_required_badges_on_badge_id_and_required_badge_id", unique: true
    t.index ["required_badge_id", "badge_id"], name: "index_required_badges_on_required_badge_id_and_badge_id", unique: true
  end

  add_foreign_key "badges", "awarders"
  add_foreign_key "badges", "categories"
end
