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

ActiveRecord::Schema.define(version: 20150225204249) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.integer  "dates"
    t.integer  "minimum_working_days"
    t.integer  "participants"
    t.boolean  "double_lecture"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "courses_ects_modules", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "ects_module_id"
  end

  add_index "courses_ects_modules", ["course_id"], name: "index_courses_ects_modules_on_course_id"
  add_index "courses_ects_modules", ["ects_module_id"], name: "index_courses_ects_modules_on_ects_module_id"

  create_table "curricula", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curricula_ects_modules", id: false, force: :cascade do |t|
    t.integer "curriculum_id"
    t.integer "ects_module_id"
  end

  add_index "curricula_ects_modules", ["curriculum_id"], name: "index_curricula_ects_modules_on_curriculum_id"
  add_index "curricula_ects_modules", ["ects_module_id"], name: "index_curricula_ects_modules_on_ects_module_id"

  create_table "ects_modules", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_unavailabilities", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "weekday_id"
    t.integer  "timeframe_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_unavailabilities", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "weekday_id"
    t.integer  "timeframe_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeframes", force: :cascade do |t|
    t.string   "interval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetable_entries", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "room_id"
    t.integer  "weekday_id"
    t.integer  "timeframe_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "timetable_id"
  end

  create_table "timetable_overfull_rooms", force: :cascade do |t|
    t.integer  "timetable_id"
    t.integer  "timetable_entry_id"
    t.integer  "severity"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "timetable_overfull_rooms", ["timetable_entry_id"], name: "index_timetable_overfull_rooms_on_timetable_entry_id"
  add_index "timetable_overfull_rooms", ["timetable_id"], name: "index_timetable_overfull_rooms_on_timetable_id"

  create_table "timetables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "costs"
  end

  create_table "weekdays", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
