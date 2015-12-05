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

ActiveRecord::Schema.define(version: 20151113011142) do

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "discipline_name"
    t.text     "discipline_description"
    t.string   "discipline_year"
    t.integer  "owner_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "discipline_id"
    t.integer  "user_id"
    t.string   "project_name"
    t.string   "project_description"
    t.string   "source"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "discipline_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "inscriptions", ["user_id", "discipline_id"], name: "index_inscriptions_on_user_id_and_discipline_id", unique: true

  create_table "rates", force: :cascade do |t|
    t.decimal  "rating_value"
    t.text     "rating_coment"
    t.string   "rating_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "repository_name"
    t.string   "repository_language"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.string   "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
