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

ActiveRecord::Schema.define(version: 20200117042927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_contents", force: :cascade do |t|
    t.string   "book_collection"
    t.string   "status"
    t.datetime "check_in_start"
    t.datetime "check_in_end"
    t.string   "sorted_by"
    t.datetime "sorted_date"
    t.datetime "shelving_start"
    t.string   "shelving_start_page"
    t.datetime "shelving_end"
    t.string   "shelving_end_page"
    t.integer  "cart_id"
    t.integer  "shelver_starter_id"
    t.integer  "shelver_finisher_id"
    t.integer  "clerk_starter_id"
    t.integer  "clerk_finisher_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "cart_contents", ["cart_id"], name: "index_cart_contents_on_cart_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.string   "name"
    t.string   "qr_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clerks", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.date     "birthday"
    t.date     "last_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_logs", force: :cascade do |t|
    t.boolean  "email"
    t.boolean  "shelf_reading"
    t.string   "department"
    t.string   "daily_tasks"
    t.string   "cleanup"
    t.boolean  "cleanup_early"
    t.boolean  "cleanup_done"
    t.integer  "carts_sorted"
    t.integer  "year"
    t.integer  "week_number"
    t.integer  "day_number"
    t.integer  "shelver_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "daily_logs", ["shelver_id"], name: "index_daily_logs_on_shelver_id", using: :btree

  create_table "library_hours", force: :cascade do |t|
    t.integer  "week_number"
    t.integer  "year"
    t.string   "sun"
    t.string   "mon"
    t.string   "tue"
    t.string   "wed"
    t.string   "thu"
    t.string   "fri"
    t.string   "sat"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "week_number"
    t.integer  "year"
    t.string   "sun"
    t.string   "mon"
    t.string   "tue"
    t.string   "wed"
    t.string   "thu"
    t.string   "fri"
    t.string   "sat"
    t.integer  "shelver_id"
    t.integer  "clerk_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "schedules", ["clerk_id"], name: "index_schedules_on_clerk_id", using: :btree
  add_index "schedules", ["shelver_id"], name: "index_schedules_on_shelver_id", using: :btree

  create_table "shelvers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.date     "birthday"
    t.date     "last_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "cart_contents", "carts"
  add_foreign_key "daily_logs", "shelvers"
  add_foreign_key "schedules", "clerks"
  add_foreign_key "schedules", "shelvers"
end
