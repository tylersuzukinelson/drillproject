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

ActiveRecord::Schema.define(version: 20150214030110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "solutions", force: :cascade do |t|
    t.integer  "drill_id"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
  end

  add_index "solutions", ["admin_id"], name: "index_solutions_on_admin_id", using: :btree
  add_index "solutions", ["drill_id"], name: "index_solutions_on_drill_id", using: :btree

  create_table "tags", force: :cascade do |t|

  create_table "drill_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "difficulty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "drills", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "drill_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "subscriptions", ["drill_group_id"], name: "index_subscriptions_on_drill_group_id", using: :btree

  add_foreign_key "subscriptions", "drill_groups"
end
