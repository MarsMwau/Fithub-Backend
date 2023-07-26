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

ActiveRecord::Schema.define(version: 2023_07_26_131244) do

  create_table "exercises", force: :cascade do |t|
    t.string "exercise_name"
    t.string "image"
    t.string "exercise_type"
    t.string "body_part"
    t.integer "duration"
    t.integer "sets"
    t.integer "reps"
    t.boolean "status"
    t.integer "calories_burned"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.string "gender"
    t.integer "height"
    t.float "initial_weight"
    t.float "target_weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weight_trackings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "weight"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_weight_trackings_on_user_id"
  end

  create_table "workout_plans", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "exercise_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_workout_plans_on_exercise_id"
    t.index ["user_id"], name: "index_workout_plans_on_user_id"
  end

  add_foreign_key "weight_trackings", "users"
  add_foreign_key "workout_plans", "exercises"
  add_foreign_key "workout_plans", "users"
end
