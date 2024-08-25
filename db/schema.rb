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

ActiveRecord::Schema.define(version: 2024_08_25_142856) do

  create_table "operators", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.string "email"
    t.string "telefono"
    t.integer "eta"
    t.string "sesso"
    t.integer "supervisor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supervisor_id"], name: "index_operators_on_supervisor_id"
  end

# Could not dump table "reports" because of following StandardError
#   Unknown type 'false' for column 'default'

  create_table "reports_done", force: :cascade do |t|
    t.string "nome_operatore"
    t.string "nome_utente"
    t.datetime "ora"
    t.date "data"
    t.string "coordinate"
    t.integer "user_id"
    t.integer "operator_id"
    t.integer "supervisor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["operator_id"], name: "index_reports_done_on_operator_id"
    t.index ["supervisor_id"], name: "index_reports_done_on_supervisor_id"
    t.index ["user_id"], name: "index_reports_done_on_user_id"
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "cognome"
    t.string "email"
    t.string "numero_di_telefono"
    t.integer "eta"
    t.string "sesso"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "operators", "supervisors"
  add_foreign_key "reports", "operators"
  add_foreign_key "reports", "users"
  add_foreign_key "reports_done", "operators"
  add_foreign_key "reports_done", "supervisors"
  add_foreign_key "reports_done", "users"
end
