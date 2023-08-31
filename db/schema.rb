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

ActiveRecord::Schema[7.0].define(version: 2023_08_31_102448) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.text "additional_details"
    t.string "symptoms"
    t.date "start_date"
    t.date "end_date"
    t.integer "status", default: 0
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["location_id"], name: "index_appointments_on_location_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doctors_locations", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_doctors_locations_on_location_id"
    t.index ["user_id"], name: "index_doctors_locations_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procedures", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.integer "price"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_procedures_on_user_id"
  end

  create_table "procedures_appointments", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.bigint "procedure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_procedures_appointments_on_appointment_id"
    t.index ["procedure_id"], name: "index_procedures_appointments_on_procedure_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "name"
    t.integer "year_obtained"
    t.string "establishment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_qualifications_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_reviews_on_appointment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "bio"
    t.string "specialty"
    t.string "image_url"
    t.integer "role", default: 0
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "gender"
    t.date "date_of_birth"
    t.string "past_interventions"
    t.string "allergies"
    t.string "insurance_provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "locations"
  add_foreign_key "appointments", "users", column: "doctor_id"
  add_foreign_key "appointments", "users", column: "patient_id"
  add_foreign_key "doctors_locations", "locations"
  add_foreign_key "doctors_locations", "users"
  add_foreign_key "procedures", "users"
  add_foreign_key "procedures_appointments", "appointments"
  add_foreign_key "procedures_appointments", "procedures"
  add_foreign_key "qualifications", "users"
  add_foreign_key "reviews", "appointments"
end
