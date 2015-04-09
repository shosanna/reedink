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

ActiveRecord::Schema.define(version: 20150404144618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "books", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "title",      null: false
    t.string   "author",     null: false
    t.integer  "page_count", null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email", force: true do |t|
    t.string  "email",  limit: nil, null: false
    t.integer "user",   limit: 8
    t.string  "verkey", limit: nil
  end

  add_index "email", ["email"], name: "unique_email", unique: true, using: :btree

  create_table "entry", force: true do |t|
    t.string   "title",       limit: nil, null: false
    t.string   "description", limit: nil
    t.integer  "user_id",     limit: 8,   null: false
    t.datetime "created_at",              null: false
  end

  create_table "notes", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.text     "text",              null: false
    t.uuid     "reading_status_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "progress", force: true do |t|
    t.integer "skill_id",   limit: 8, null: false
    t.date    "created_at",           null: false
    t.integer "user_id",    limit: 8, null: false
  end

  create_table "progresses", force: true do |t|
    t.uuid     "reading_status_id", null: false
    t.integer  "page_from",         null: false
    t.integer  "page_to",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readable", force: true do |t|
    t.string  "title",       limit: nil, null: false
    t.string  "description", limit: nil
    t.string  "type",        limit: nil, null: false
    t.string  "author",      limit: nil, null: false
    t.integer "page_count",  limit: 8,   null: false
    t.integer "owner_id",    limit: 8,   null: false
    t.string  "url",         limit: nil
  end

  create_table "reading_statuses", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "user_id"
    t.uuid     "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_progress_at", null: false
  end

  create_table "record", force: true do |t|
    t.integer  "readable_id", limit: 8, null: false
    t.integer  "page_start",  limit: 8, null: false
    t.integer  "page_end",    limit: 8, null: false
    t.integer  "user_id",     limit: 8, null: false
    t.datetime "created_at",            null: false
  end

  create_table "reports", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "skill_id"
    t.string   "title"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill", force: true do |t|
    t.string  "name",    limit: nil, null: false
    t.integer "user_id", limit: 8,   null: false
  end

  create_table "skills", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.uuid     "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "taggable_id",   null: false
    t.string   "taggable_type", null: false
    t.uuid     "tag_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user", force: true do |t|
    t.string "ident",    limit: nil, null: false
    t.string "password", limit: nil
  end

  add_index "user", ["ident"], name: "unique_user", unique: true, using: :btree

  create_table "user_reading", force: true do |t|
    t.integer "readable_id", limit: 8,   null: false
    t.integer "user_id",     limit: 8,   null: false
    t.string  "status",      limit: nil, null: false
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
