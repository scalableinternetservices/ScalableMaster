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

ActiveRecord::Schema.define(version: 20150415194812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "img_url"
    t.string   "phone"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "scale"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "organizer_id"
  end

  add_index "activities", ["organizer_id"], name: "index_activities_on_organizer_id", using: :btree

  create_table "activities_participants", id: false, force: :cascade do |t|
    t.integer "activity_id",    null: false
    t.integer "participant_id", null: false
  end

  add_index "activities_participants", ["activity_id"], name: "index_activities_participants_on_activity_id", using: :btree
  add_index "activities_participants", ["participant_id"], name: "index_activities_participants_on_participant_id", using: :btree

  create_table "activities_tags", id: false, force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "tag_id",      null: false
  end

  add_index "activities_tags", ["activity_id"], name: "index_activities_tags_on_activity_id", using: :btree
  add_index "activities_tags", ["tag_id"], name: "index_activities_tags_on_tag_id", using: :btree

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "participant_id"
  end

  add_index "ideas", ["participant_id"], name: "index_ideas_on_participant_id", using: :btree

  create_table "ideas_tags", id: false, force: :cascade do |t|
    t.integer "idea_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "ideas_tags", ["idea_id"], name: "index_ideas_tags_on_idea_id", using: :btree
  add_index "ideas_tags", ["tag_id"], name: "index_ideas_tags_on_tag_id", using: :btree

  create_table "organizers", force: :cascade do |t|
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
    t.string   "name"
    t.string   "nickname"
    t.integer  "gender"
    t.integer  "age"
    t.string   "phone"
    t.string   "address"
    t.string   "img_url"
    t.text     "intro"
  end

  add_index "organizers", ["email"], name: "index_organizers_on_email", unique: true, using: :btree
  add_index "organizers", ["reset_password_token"], name: "index_organizers_on_reset_password_token", unique: true, using: :btree

  create_table "organizers_tags", id: false, force: :cascade do |t|
    t.integer "organizer_id", null: false
    t.integer "tag_id",       null: false
  end

  add_index "organizers_tags", ["organizer_id"], name: "index_organizers_tags_on_organizer_id", using: :btree
  add_index "organizers_tags", ["tag_id"], name: "index_organizers_tags_on_tag_id", using: :btree

  create_table "participants", force: :cascade do |t|
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
    t.string   "name"
    t.string   "nickname"
    t.integer  "gender"
    t.integer  "age"
    t.string   "phone"
    t.string   "address"
    t.string   "img_url"
  end

  add_index "participants", ["email"], name: "index_participants_on_email", unique: true, using: :btree
  add_index "participants", ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true, using: :btree

  create_table "participants_tags", id: false, force: :cascade do |t|
    t.integer "participant_id", null: false
    t.integer "tag_id",         null: false
  end

  add_index "participants_tags", ["participant_id"], name: "index_participants_tags_on_participant_id", using: :btree
  add_index "participants_tags", ["tag_id"], name: "index_participants_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "organizers"
  add_foreign_key "ideas", "participants"
end
