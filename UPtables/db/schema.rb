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

ActiveRecord::Schema.define(version: 20150319145233) do

  create_table "course_components", force: :cascade do |t|
    t.string   "type"
    t.integer  "dates"
    t.integer  "minimum_working_days"
    t.boolean  "double_lecture"
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "participants"
  end

  add_index "course_components", ["course_id"], name: "index_course_components_on_course_id"
  add_index "course_components", ["teacher_id"], name: "index_course_components_on_teacher_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.integer  "participants"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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

  create_table "curriculum_module_assignments", force: :cascade do |t|
    t.integer  "curriculum_id"
    t.integer  "ects_module_id"
    t.boolean  "mandatory",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "curriculum_module_assignments", ["curriculum_id"], name: "index_curriculum_module_assignments_on_curriculum_id"
  add_index "curriculum_module_assignments", ["ects_module_id"], name: "index_curriculum_module_assignments_on_ects_module_id"

  create_table "curriculum_unavailabilities", force: :cascade do |t|
    t.integer  "weekday_id"
    t.integer  "timeframe_id"
    t.integer  "curriculum_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "curriculum_unavailabilities", ["curriculum_id"], name: "index_curriculum_unavailabilities_on_curriculum_id"
  add_index "curriculum_unavailabilities", ["timeframe_id"], name: "index_curriculum_unavailabilities_on_timeframe_id"
  add_index "curriculum_unavailabilities", ["weekday_id"], name: "index_curriculum_unavailabilities_on_weekday_id"

  create_table "ects_modules", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "curriculum_id"
    t.integer  "semester"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recommendations", ["course_id"], name: "index_recommendations_on_course_id"
  add_index "recommendations", ["curriculum_id"], name: "index_recommendations_on_curriculum_id"

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
    t.integer  "entry_id"
    t.integer  "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "timetable_overfull_rooms", ["entry_id"], name: "index_timetable_overfull_rooms_on_entry_id"

  create_table "timetables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "costs"
    t.boolean  "optimum"
  end

  create_table "weekdays", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
