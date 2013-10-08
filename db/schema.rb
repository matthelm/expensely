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

ActiveRecord::Schema.define(version: 20131008035853) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "handle"
    t.integer  "categories_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["categories_id"], name: "index_categories_on_categories_id"

  create_table "expenses", force: true do |t|
    t.decimal  "total_amount"
    t.string   "currency"
    t.decimal  "total_cad"
    t.decimal  "total_tax"
    t.integer  "category_id"
    t.date     "incurred_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["category_id"], name: "index_expenses_on_category_id"

end
