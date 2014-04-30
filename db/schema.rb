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

ActiveRecord::Schema.define(version: 20140430134337) do

  create_table "caseinfos", force: true do |t|
    t.string   "invno"
    t.string   "itmoc"
    t.string   "uain"
    t.string   "patno"
    t.string   "complaint"
    t.string   "country"
    t.string   "respondents"
    t.string   "alj"
    t.string   "ouiiattorney"
    t.string   "gcattorney"
    t.string   "statusbeforecommission"
    t.string   "noticeofinv"
    t.string   "proceedtype"
    t.string   "currentphase"
    t.string   "invtermdate"
    t.string   "publishopinion"
    t.string   "relatedcourtdecision"
    t.string   "appealstatus"
    t.string   "disposition"
    t.string   "unfairactsfound"
    t.string   "notes"
    t.string   "activeexpiredremedial"
    t.string   "exclusioncdorders"
    t.string   "targetdate"
    t.string   "violationfinalduedate"
    t.string   "beginenddates"
    t.string   "archivist"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "patno_key"
  end

  create_table "caseinfos_patentnos", id: false, force: true do |t|
    t.integer "caseinfo_id"
    t.integer "patentno_id"
  end

  create_table "patentnos", force: true do |t|
    t.string   "patno"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scrapeparams", force: true do |t|
    t.string   "url"
    t.integer  "pages"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
