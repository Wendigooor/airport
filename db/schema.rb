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

ActiveRecord::Schema.define(version: 20150624141953) do

  create_table "histories", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.integer  "plane_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["plane_id"], name: "index_histories_on_plane_id", using: :btree

  create_table "plane_queues", force: :cascade do |t|
    t.integer  "plane_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planes", force: :cascade do |t|
    t.integer  "time_for_takeoff", limit: 4
    t.string   "status",           limit: 255
    t.string   "name",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
