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

ActiveRecord::Schema.define(version: 20150510215143) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.string   "img_url",             limit: 255
    t.string   "phone",               limit: 255
    t.string   "address",             limit: 255
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "scale",               limit: 4
    t.string   "email",               limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "organizer_id",        limit: 4
    t.string   "avatar",              limit: 255
    t.string   "city_name",           limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "activities", ["organizer_id"], name: "index_activities_on_organizer_id", using: :btree

  create_table "activities_participants", id: false, force: :cascade do |t|
    t.integer "activity_id",    limit: 4, null: false
    t.integer "participant_id", limit: 4, null: false
  end

  add_index "activities_participants", ["activity_id"], name: "index_activities_participants_on_activity_id", using: :btree
  add_index "activities_participants", ["participant_id"], name: "index_activities_participants_on_participant_id", using: :btree

  create_table "activities_tags", id: false, force: :cascade do |t|
    t.integer "activity_id", limit: 4, null: false
    t.integer "tag_id",      limit: 4, null: false
  end

  add_index "activities_tags", ["activity_id"], name: "index_activities_tags_on_activity_id", using: :btree
  add_index "activities_tags", ["tag_id"], name: "index_activities_tags_on_tag_id", using: :btree

  create_table "ideas", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description",    limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "participant_id", limit: 4
    t.integer  "stars",          limit: 4,     default: 0
  end

  add_index "ideas", ["participant_id"], name: "index_ideas_on_participant_id", using: :btree

  create_table "ideas_tags", id: false, force: :cascade do |t|
    t.integer "idea_id", limit: 4, null: false
    t.integer "tag_id",  limit: 4, null: false
  end

  add_index "ideas_tags", ["idea_id"], name: "index_ideas_tags_on_idea_id", using: :btree
  add_index "ideas_tags", ["tag_id"], name: "index_ideas_tags_on_tag_id", using: :btree

  create_table "organizers", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "nickname",               limit: 255
    t.integer  "gender",                 limit: 4
    t.integer  "age",                    limit: 4
    t.string   "phone",                  limit: 255
    t.string   "address",                limit: 255
    t.string   "img_url",                limit: 255
    t.text     "intro",                  limit: 65535
    t.string   "avatar",                 limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "organizers", ["email"], name: "index_organizers_on_email", unique: true, using: :btree
  add_index "organizers", ["reset_password_token"], name: "index_organizers_on_reset_password_token", unique: true, using: :btree

  create_table "organizers_tags", id: false, force: :cascade do |t|
    t.integer "organizer_id", limit: 4, null: false
    t.integer "tag_id",       limit: 4, null: false
  end

  add_index "organizers_tags", ["organizer_id"], name: "index_organizers_tags_on_organizer_id", using: :btree
  add_index "organizers_tags", ["tag_id"], name: "index_organizers_tags_on_tag_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "nickname",               limit: 255
    t.integer  "gender",                 limit: 4
    t.integer  "age",                    limit: 4
    t.string   "phone",                  limit: 255
    t.string   "address",                limit: 255
    t.string   "img_url",                limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "participants", ["email"], name: "index_participants_on_email", unique: true, using: :btree
  add_index "participants", ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true, using: :btree

  create_table "participants_tags", id: false, force: :cascade do |t|
    t.integer "participant_id", limit: 4, null: false
    t.integer "tag_id",         limit: 4, null: false
  end

  add_index "participants_tags", ["participant_id"], name: "index_participants_tags_on_participant_id", using: :btree
  add_index "participants_tags", ["tag_id"], name: "index_participants_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "activities", "organizers"
  add_foreign_key "ideas", "participants"
end
