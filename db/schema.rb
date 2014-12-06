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

ActiveRecord::Schema.define(version: 20141206181051) do

  create_table "budgets", force: true do |t|
    t.float    "income"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "budgets", ["user_id", "created_at"], name: "index_budgets_on_user_id_and_created_at"
  add_index "budgets", ["user_id"], name: "index_budgets_on_user_id"

  create_table "expenses", force: true do |t|
    t.text     "name"
    t.text     "category"
    t.float    "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "expenses", ["user_id", "category"], name: "index_expenses_on_user_id_and_category"
  add_index "expenses", ["user_id", "created_at"], name: "index_expenses_on_user_id_and_created_at"
  add_index "expenses", ["user_id", "value"], name: "index_expenses_on_user_id_and_value"
  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
