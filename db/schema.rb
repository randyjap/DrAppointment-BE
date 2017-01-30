# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170129015532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_dates", force: :cascade do |t|
    t.date     "appointment_date", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["appointment_date"], name: "index_appointment_dates_on_appointment_date", unique: true, using: :btree
  end

  create_table "appointment_patients", force: :cascade do |t|
    t.integer  "appointment_id", null: false
    t.integer  "patient_id",     null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["appointment_id"], name: "index_appointment_patients_on_appointment_id", using: :btree
    t.index ["patient_id"], name: "index_appointment_patients_on_patient_id", using: :btree
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "doctor_id",    null: false
    t.integer  "time_slot_id", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id", using: :btree
    t.index ["time_slot_id"], name: "index_appointments_on_time_slot_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "blocked_times", force: :cascade do |t|
    t.integer  "doctor_id",    null: false
    t.integer  "time_slot_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["doctor_id"], name: "index_blocked_times_on_doctor_id", using: :btree
    t.index ["time_slot_id"], name: "index_blocked_times_on_time_slot_id", using: :btree
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "salutation",    null: false
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.string   "street",        null: false
    t.string   "street_number", null: false
    t.string   "city",          null: false
    t.string   "zip_code",      null: false
    t.string   "state",         null: false
    t.float    "lat",           null: false
    t.float    "lng",           null: false
    t.string   "image_url",     null: false
    t.string   "phone_number",  null: false
    t.string   "country_code",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["first_name"], name: "index_doctors_on_first_name", using: :btree
    t.index ["last_name"], name: "index_doctors_on_last_name", using: :btree
    t.index ["lat"], name: "index_doctors_on_lat", using: :btree
    t.index ["lng"], name: "index_doctors_on_lng", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "doctor_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_favorites_on_doctor_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id", using: :btree
  end

  create_table "time_slots", force: :cascade do |t|
    t.integer  "appointment_date_id", null: false
    t.string   "time",                null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["appointment_date_id"], name: "index_time_slots_on_appointment_date_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.string   "phone_number",  null: false
    t.string   "country_code",  null: false
    t.string   "authy_id",      null: false
    t.string   "session_token", null: false
    t.string   "status",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
    t.index ["session_token"], name: "index_users_on_session_token", using: :btree
  end

end
