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

ActiveRecord::Schema.define(version: 2019_08_29_150714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awarded_badges", force: :cascade do |t|
    t.bigint "badge_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_comment"
    t.string "awarder_comment"
    t.index ["badge_id"], name: "index_awarded_badges_on_badge_id"
    t.index ["user_id"], name: "index_awarded_badges_on_user_id"
  end

  create_table "awarders", force: :cascade do |t|
    t.string "name"
    t.integer "external_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "badge_requests", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "staff_id", null: false
    t.bigint "badge_id"
    t.string "comment"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "awarder_comment"
    t.index ["badge_id", "student_id"], name: "index_badge_requests_on_badge_id_and_student_id", unique: true
    t.index ["badge_id"], name: "index_badge_requests_on_badge_id"
    t.index ["student_id", "badge_id"], name: "index_badge_requests_on_student_id_and_badge_id", unique: true
  end

  create_table "badge_requirements", force: :cascade do |t|
    t.integer "badge_id"
    t.integer "badge_requirement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id", "badge_requirement_id"], name: "index_badge_requirements_on_badge_id_and_badge_requirement_id", unique: true
    t.index ["badge_requirement_id", "badge_id"], name: "index_badge_requirements_on_badge_requirement_id_and_badge_id", unique: true
  end

  create_table "badges", force: :cascade do |t|
    t.string "name", null: false
    t.integer "external_id", null: false
    t.bigint "category_id"
    t.bigint "awarder_id"
    t.string "criteria"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon"
    t.integer "inner_colour"
    t.integer "level"
    t.integer "icon_colour"
    t.string "banner"
    t.boolean "active"
    t.index ["awarder_id"], name: "index_badges_on_awarder_id"
    t.index ["category_id"], name: "index_badges_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "external_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  end

  create_table "school_organisation_paths", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.string "org_path"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_school_organisation_paths_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.string "family_name"
    t.string "given_name"
    t.integer "role"
    t.boolean "active"
    t.bigint "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  add_foreign_key "awarded_badges", "badges"
  add_foreign_key "awarded_badges", "users"
  add_foreign_key "badge_requests", "badges"
  add_foreign_key "badges", "awarders"
  add_foreign_key "badges", "categories"
  add_foreign_key "school_organisation_paths", "schools"
end
