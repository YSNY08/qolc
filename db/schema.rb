# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_06_122550) do

  create_table "achievement_results", force: :cascade do |t|
    t.string "duration"
    t.integer "user_id", null: false
    t.integer "achievement_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_actions", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "user_id", null: false
    t.integer "daily_evaluate_id", null: false
    t.string "content"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_evaluate_id"], name: "index_daily_actions_on_daily_evaluate_id"
    t.index ["user_id"], name: "index_daily_actions_on_user_id"
  end

  create_table "daily_evaluates", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedule_results", force: :cascade do |t|
    t.boolean "is_success"
    t.integer "schedule_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "start"
    t.datetime "end"
    t.datetime "allDay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "daily_actions", "daily_evaluates"
  add_foreign_key "daily_actions", "users"
  add_foreign_key "schedules", "users"
end
