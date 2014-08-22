# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140822164351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "amenities", force: true do |t|
    t.string   "title"
    t.string   "img_id"
    t.string   "img_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity"
  end

  create_table "contract_texts", force: true do |t|
    t.text     "contract"
    t.text     "living_standards"
    t.text     "parking_acknowledgement"
    t.text     "eligibility"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "addendum"
  end

  create_table "contracts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "home_address_1"
    t.string   "home_address_2"
    t.string   "home_city"
    t.string   "home_state"
    t.string   "home_zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parking_type"
    t.string   "phone"
    t.string   "apartment_type"
    t.integer  "building_id"
    t.string   "eligibility_sig"
    t.string   "living_standards_sig"
    t.string   "parking_ack"
    t.string   "euro"
    t.string   "contract_agreement"
    t.text     "preferences"
    t.text     "number"
    t.integer  "contract_text_id"
  end

  add_index "contracts", ["building_id"], name: "index_contracts_on_building_id", using: :btree
  add_index "contracts", ["contract_text_id"], name: "index_contracts_on_contract_text_id", using: :btree

  create_table "contracts_semesters", force: true do |t|
    t.integer "contract_id"
    t.integer "semester_id"
  end

  add_index "contracts_semesters", ["contract_id"], name: "index_contracts_semesters_on_contract_id", using: :btree
  add_index "contracts_semesters", ["semester_id"], name: "index_contracts_semesters_on_semester_id", using: :btree

  create_table "marketing_texts", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semesters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deposit"
    t.integer  "rent"
    t.integer  "duration"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "payment_due"
  end

end
