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

ActiveRecord::Schema[8.0].define(version: 2024_12_23_224712) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "analyses", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "date"
    t.string "category"
    t.string "status"
    t.text "result"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_analyses_on_patient_id"
  end

  create_table "batches", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blood_samples", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cell_culture_processes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "date"
    t.text "description"
    t.text "treatment"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_diagnoses_on_patient_id"
  end

  create_table "diagnostic_orders", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "doctor_name"
    t.datetime "prescribed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_diagnostic_orders_on_patient_id"
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "title"
    t.string "category"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_documents_on_patient_id"
  end

  create_table "follow_ups", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "date"
    t.text "notes"
    t.date "next_appointment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_follow_ups_on_patient_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
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
    t.string "gender"
    t.string "phone"
    t.text "address"
    t.text "medical_history"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "barcode", null: false
    t.string "manufacturer"
    t.string "reference_number"
    t.string "category"
    t.index ["barcode"], name: "index_products_on_barcode", unique: true
  end

  create_table "protein_processes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_samples_on_patient_id"
  end

  create_table "stock_batches", force: :cascade do |t|
    t.string "number"
    t.bigint "stock_item_id", null: false
    t.integer "quantity"
    t.date "received_date"
    t.date "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_stock_batches_on_number", unique: true
    t.index ["stock_item_id"], name: "index_stock_batches_on_stock_item_id"
  end

  create_table "stock_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_items", force: :cascade do |t|
    t.string "name"
    t.string "reference"
    t.bigint "stock_category_id", null: false
    t.integer "minimum_quantity", default: 0
    t.integer "current_quantity", default: 0
    t.string "unit"
    t.string "location"
    t.date "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["product_id"], name: "index_stock_items_on_product_id"
    t.index ["reference"], name: "index_stock_items_on_reference", unique: true
    t.index ["stock_category_id"], name: "index_stock_items_on_stock_category_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_tasks_on_list_id"
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "job_title"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "analyses", "patients"
  add_foreign_key "diagnoses", "patients"
  add_foreign_key "diagnostic_orders", "patients"
  add_foreign_key "documents", "patients"
  add_foreign_key "follow_ups", "patients"
  add_foreign_key "results", "tests"
  add_foreign_key "samples", "patients"
  add_foreign_key "stock_batches", "stock_items"
  add_foreign_key "stock_items", "products"
  add_foreign_key "stock_items", "stock_categories"
  add_foreign_key "tasks", "lists"
  add_foreign_key "tests", "diagnostic_orders"
end
