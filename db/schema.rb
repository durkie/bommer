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

ActiveRecord::Schema.define(version: 20190412172536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.string   "name"
    t.boolean  "needs_maintenance", default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "assembly_manifests", force: :cascade do |t|
    t.integer  "parent_assembly_id"
    t.integer  "assembly_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "assembly_manifests", ["parent_assembly_id"], name: "index_assembly_manifests_on_parent_assembly_id", using: :btree

  create_table "part_manifests", force: :cascade do |t|
    t.integer  "part_id"
    t.integer  "assembly_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "part_manifests", ["assembly_id"], name: "index_part_manifests_on_assembly_id", using: :btree
  add_index "part_manifests", ["part_id"], name: "index_part_manifests_on_part_id", using: :btree

  create_table "parts", force: :cascade do |t|
    t.string   "name"
    t.string   "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parts", ["part_id"], name: "index_parts_on_part_id", unique: true, using: :btree

end
