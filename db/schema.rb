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

ActiveRecord::Schema.define(version: 20140325012047) do

  create_table "leave_requests", force: true do |t|
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "leave_type"
    t.string   "comment"
    t.string   "approved"
  end

  create_table "spend_toils", force: true do |t|
    t.integer  "user_id"
    t.integer  "initial_amount"
    t.integer  "amount"
    t.date     "leave_date"
    t.string   "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_days", force: true do |t|
    t.date     "time_day"
    t.integer  "time_sheet_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_days", ["time_sheet_id"], name: "index_time_days_on_time_sheet_id"
  add_index "time_days", ["user_id"], name: "index_time_days_on_user_id"

  create_table "time_items", force: true do |t|
    t.integer  "time_day_id"
    t.integer  "user_id"
    t.integer  "time_lodged"
    t.string   "description"
    t.string   "category"
    t.string   "cost_centre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_items", ["time_day_id"], name: "index_time_items_on_time_day_id"
  add_index "time_items", ["user_id"], name: "index_time_items_on_user_id"

  create_table "time_sheets", force: true do |t|
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_sheets", ["user_id"], name: "index_time_sheets_on_user_id"

  create_table "toil_requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "initial_amount"
    t.integer  "amount"
    t.date     "date_accrued"
    t.string   "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_accrued_end"
  end

  add_index "toil_requests", ["user_id"], name: "index_toil_requests_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.string   "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
