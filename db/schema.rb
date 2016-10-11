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

ActiveRecord::Schema.define(version: 20161011150045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "jobseeker_id"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bizowners", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "postal_code"
    t.text     "description"
    t.string   "license_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_bizowners_on_user_id", using: :btree
  end

  create_table "bizowners_reviews", force: :cascade do |t|
    t.integer  "bizowner_id"
    t.integer  "jobseeker_id"
    t.integer  "bizowner_review_star"
    t.text     "business_review_description"
    t.date     "job_end_date"
    t.boolean  "status"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "jobseekers", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "dob"
    t.string   "postal_code"
    t.string   "highest_qualification"
    t.string   "preferred_area"
    t.string   "preferred_location"
    t.text     "description"
    t.float    "wage"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "availability"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_jobseekers_on_user_id", using: :btree
  end

  create_table "jobseekers_reviews", force: :cascade do |t|
    t.integer  "jobseeker_id"
    t.integer  "bizowner_id"
    t.integer  "jobseeker_review_star"
    t.text     "jobseeker_review_description"
    t.date     "job_end_date"
    t.boolean  "status"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "bizowner_id"
    t.string   "job_title"
    t.text     "job_description"
    t.string   "industry"
    t.integer  "vacancy"
    t.string   "work_location_postal_code"
    t.string   "main_work_location"
    t.string   "work_location"
    t.float    "wage_per_hour"
    t.date     "job_start_date"
    t.date     "job_end_date"
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["bizowner_id"], name: "index_listings_on_bizowner_id", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "address"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "contact"
    t.boolean  "is_biz"
    t.boolean  "is_seeker"
    t.boolean  "is_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "bizowners", "users"
  add_foreign_key "jobseekers", "users"
  add_foreign_key "listings", "bizowners"
end
