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

ActiveRecord::Schema[7.0].define(version: 2024_01_29_193034) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "measures", force: :cascade do |t|
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nonconformities", force: :cascade do |t|
    t.bigint "vehicle_parts_id", null: false
    t.bigint "nonconformity_types_id", null: false
    t.bigint "nonconformity_levels_id", null: false
    t.bigint "quadrants_id", null: false
    t.bigint "measures_id", null: false
    t.bigint "nonconformity_locals_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["measures_id"], name: "index_nonconformities_on_measures_id"
    t.index ["nonconformity_levels_id"], name: "index_nonconformities_on_nonconformity_levels_id"
    t.index ["nonconformity_locals_id"], name: "index_nonconformities_on_nonconformity_locals_id"
    t.index ["nonconformity_types_id"], name: "index_nonconformities_on_nonconformity_types_id"
    t.index ["quadrants_id"], name: "index_nonconformities_on_quadrants_id"
    t.index ["vehicle_parts_id"], name: "index_nonconformities_on_vehicle_parts_id"
  end

  create_table "nonconformity_levels", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nonconformity_locals", force: :cascade do |t|
    t.string "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nonconformity_types", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quadrants", force: :cascade do |t|
    t.integer "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "login"
    t.string "role"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_parts", force: :cascade do |t|
    t.integer "area"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "location"
    t.string "type"
    t.string "chassis"
    t.integer "nonconformity"
    t.string "model"
    t.string "status"
    t.string "ship"
    t.string "situation"
    t.text "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "nonconformities", "measures", column: "measures_id"
  add_foreign_key "nonconformities", "nonconformity_levels", column: "nonconformity_levels_id"
  add_foreign_key "nonconformities", "nonconformity_locals", column: "nonconformity_locals_id"
  add_foreign_key "nonconformities", "nonconformity_types", column: "nonconformity_types_id"
  add_foreign_key "nonconformities", "quadrants", column: "quadrants_id"
  add_foreign_key "nonconformities", "vehicle_parts", column: "vehicle_parts_id"
end
