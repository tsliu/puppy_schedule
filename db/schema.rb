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

ActiveRecord::Schema.define(version: 20150202053128) do

  create_table "barks", force: :cascade do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id"
    t.integer  "priority",    null: false
    t.text     "preview",     null: false
    t.text     "text",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "barks", ["receiver_id"], name: "index_barks_on_receiver_id"
  add_index "barks", ["sender_id"], name: "index_barks_on_sender_id"

  create_table "puppies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       null: false
    t.date     "dob",        null: false
    t.string   "breed",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "puppies", ["breed"], name: "index_puppies_on_breed"
  add_index "puppies", ["dob"], name: "index_puppies_on_dob"
  add_index "puppies", ["user_id"], name: "index_puppies_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest"
    t.string   "name",            null: false
    t.string   "cell_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"

end
