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

ActiveRecord::Schema.define(version: 20150617200303) do

  create_table "analysis_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analysis_groups_monograph_holdings", id: false, force: :cascade do |t|
    t.integer "analysis_group_id",    null: false
    t.integer "monograph_holding_id", null: false
  end

  create_table "circulations", force: :cascade do |t|
    t.integer  "oclc_number"
    t.date     "loan_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "interlibrary_lendings", force: :cascade do |t|
    t.integer  "oclc_number"
    t.string   "request_type"
    t.datetime "transaction_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "interlibrary_loans", force: :cascade do |t|
    t.integer  "oclc_number"
    t.string   "request_type"
    t.date     "transaction_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "lending_library"
  end

  create_table "monograph_holdings", force: :cascade do |t|
    t.integer  "oclc_number",          limit: 8
    t.string   "lc_number"
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.float    "price"
    t.string   "acquisition_modality"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "acquisition_date"
    t.string   "language"
    t.integer  "publication_date"
    t.integer  "publication_year"
    t.string   "sub_library"
    t.string   "collection"
    t.string   "material_type"
  end

  create_table "overlap_groups", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overlap_holdings", force: :cascade do |t|
    t.integer  "oclc_number"
    t.integer  "shared_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "overlap_group_id"
  end

  add_index "overlap_holdings", ["overlap_group_id"], name: "index_overlap_holdings_on_overlap_group_id"

end
