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

ActiveRecord::Schema[7.1].define(version: 2024_12_25_020007) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "name", null: false
    t.bigint "patient_id", null: false
    t.bigint "blood_sample_id", null: false
    t.integer "status", default: 0
    t.datetime "started_at"
    t.datetime "completed_at"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blood_sample_id"], name: "index_analyses_on_blood_sample_id"
    t.index ["patient_id"], name: "index_analyses_on_patient_id"
  end

  create_table "blood_samples", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "reference", null: false
    t.datetime "collection_date"
    t.string "collection_site"
    t.integer "volume"
    t.string "unit"
    t.integer "status", default: 0
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_blood_samples_on_patient_id"
    t.index ["reference"], name: "index_blood_samples_on_reference", unique: true
  end

  create_table "cell_culture_processes", force: :cascade do |t|
    t.bigint "analysis_id", null: false
    t.bigint "blood_sample_id", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.integer "cell_count"
    t.decimal "viability"
    t.text "notes"
    t.string "media_used"
    t.integer "passage_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["analysis_id"], name: "index_cell_culture_processes_on_analysis_id"
    t.index ["blood_sample_id"], name: "index_cell_culture_processes_on_blood_sample_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "phone"
    t.date "birth_date"
    t.string "gender"
    t.text "medical_history"
    t.string "patient_number", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["last_name", "first_name"], name: "index_patients_on_last_name_and_first_name"
    t.index ["patient_number"], name: "index_patients_on_patient_number", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "reference"
    t.text "description"
    t.string "manufacturer"
    t.string "category"
    t.decimal "unit_price"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "protein_processes", force: :cascade do |t|
    t.bigint "analysis_id", null: false
    t.bigint "blood_sample_id", null: false
    t.decimal "concentration"
    t.decimal "purity"
    t.string "method_used"
    t.text "notes"
    t.datetime "processed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["analysis_id"], name: "index_protein_processes_on_analysis_id"
    t.index ["blood_sample_id"], name: "index_protein_processes_on_blood_sample_id"
  end

  create_table "stock_batches", force: :cascade do |t|
    t.bigint "stock_item_id", null: false
    t.string "batch_number"
    t.integer "quantity"
    t.date "expiry_date"
    t.decimal "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.string "reference"
    t.integer "status", default: 0
    t.index ["batch_number"], name: "index_stock_batches_on_batch_number", unique: true
    t.index ["reference"], name: "index_stock_batches_on_reference", unique: true
    t.index ["stock_item_id"], name: "index_stock_batches_on_stock_item_id"
  end

  create_table "stock_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stock_categories_on_name", unique: true
  end

  create_table "stock_items", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "stock_category_id", null: false
    t.bigint "product_id"
    t.integer "minimum_quantity"
    t.integer "reorder_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "barcode"
    t.string "unit"
    t.string "reference"
    t.index ["barcode"], name: "index_stock_items_on_barcode", unique: true
    t.index ["product_id"], name: "index_stock_items_on_product_id"
    t.index ["reference"], name: "index_stock_items_on_reference", unique: true
    t.index ["stock_category_id"], name: "index_stock_items_on_stock_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
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
    t.string "first_name"
    t.string "last_name"
    t.integer "role", default: 0
    t.integer "status", default: 0
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "analyses", "blood_samples"
  add_foreign_key "analyses", "patients"
  add_foreign_key "blood_samples", "patients"
  add_foreign_key "cell_culture_processes", "analyses"
  add_foreign_key "cell_culture_processes", "blood_samples"
  add_foreign_key "protein_processes", "analyses"
  add_foreign_key "protein_processes", "blood_samples"
  add_foreign_key "stock_batches", "stock_items"
  add_foreign_key "stock_items", "products"
  add_foreign_key "stock_items", "stock_categories"
end
