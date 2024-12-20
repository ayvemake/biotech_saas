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

ActiveRecord::Schema[8.0].define(version: 2024_12_20_023044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "diagnostic_orders", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "doctor_name"
    t.datetime "prescribed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_diagnostic_orders_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.integer "status"
    t.date "date_of_birth"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "test_id", null: false
    t.text "raw_data"
    t.text "interpretation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_results_on_test_id"
  end

  create_table "samples", force: :cascade do |t|
    t.string "barcode"
    t.bigint "patient_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_samples_on_patient_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "diagnostic_order_id", null: false
    t.string "name"
    t.string "status"
    t.datetime "performed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnostic_order_id"], name: "index_tests_on_diagnostic_order_id"
  end

  add_foreign_key "diagnostic_orders", "patients"
  add_foreign_key "results", "tests"
  add_foreign_key "samples", "patients"
  add_foreign_key "tests", "diagnostic_orders"
end
