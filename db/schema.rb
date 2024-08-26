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

ActiveRecord::Schema.define(version: 2024_08_24_163933) do

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "telephone_number"
    t.integer "age"
    t.string "sex"
    t.integer "supervisor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supervisor_id"], name: "index_operators_on_supervisor_id"
  end

  create_table "reports", force: :cascade do |t|
  t.time "report_time"
  t.date "report_date"
  t.string "coordinates"
  t.integer "user_id"
  t.integer "operator_id"
  t.boolean "accepted", default: false
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
end

  create_table "reports_done", force: :cascade do |t|
    t.integer "operator_id"
    t.integer "user_id"
    t.time "time"
    t.date "date"
    t.string "coordinates"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "telephone_number"
    t.integer "age"
    t.string "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "operators", "supervisors"
  add_foreign_key "reports", "operators"
  add_foreign_key "reports", "users"
  add_foreign_key "reports_done", "operators"
  add_foreign_key "reports_done", "users"
end
