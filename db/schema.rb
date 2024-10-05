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

ActiveRecord::Schema.define(version: 2024_10_02_143847) do

  create_table "measurement_data", force: :cascade do |t|
    t.string "measurement_type"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_measurement_data_on_user_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "surname"
    t.string "workplace"
    t.string "supervisor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_operators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true
  end

  create_table "report_dones", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "report_datetime", null: false
    t.string "coordinates", null: false
    t.string "user_id", null: false
    t.string "operator_id"
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.string "question4"
    t.string "question5"
    t.string "question6"
    t.string "question7"
    t.string "question8"
    t.string "question9"
    t.string "question10"
    t.string "question11"
    t.string "question12"
    t.string "question13"
    t.string "question14"
    t.integer "contact_method", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "coordinates", null: false
    t.string "user_id", null: false
    t.string "operator_id"
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.string "question4"
    t.string "question5"
    t.string "question6"
    t.string "question7"
    t.string "question8"
    t.string "question9"
    t.string "question10"
    t.string "question11"
    t.string "question12"
    t.string "question13"
    t.string "question14"
    t.integer "contact_method", null: false
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "surname"
    t.string "workplace"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_supervisors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_supervisors_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.string "sex"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "blood_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "measurement_data", "users"
  add_foreign_key "operators", "supervisors"
  add_foreign_key "report_dones", "operators"
  add_foreign_key "report_dones", "users"
  add_foreign_key "reports", "operators"
  add_foreign_key "reports", "users"
end
