# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_06_021515) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category_name", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_categories_on_profile_id"
  end

  create_table "list_deadlines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "list_deadline_date", null: false
    t.time "list_deadline_time", null: false
    t.bigint "list_id", null: false
    t.bigint "profile_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "unfinished"
    t.index ["category_id"], name: "index_list_deadlines_on_category_id"
    t.index ["list_id"], name: "index_list_deadlines_on_list_id"
    t.index ["profile_id"], name: "index_list_deadlines_on_profile_id"
  end

  create_table "list_reminds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "list_remind_date", null: false
    t.time "list_remind_time", null: false
    t.string "list_remind_title", null: false
    t.text "list_remind_detail"
    t.bigint "list_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "unfinished"
    t.index ["list_id"], name: "index_list_reminds_on_list_id"
    t.index ["profile_id"], name: "index_list_reminds_on_profile_id"
  end

  create_table "lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "list_title", null: false
    t.text "list_detail"
    t.integer "priority_id"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_lists_on_category_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "precious_word"
    t.date "birth_date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reminds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "list_deadline_id"
    t.bigint "list_remind_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_deadline_id"], name: "index_reminds_on_list_deadline_id"
    t.index ["list_remind_id"], name: "index_reminds_on_list_remind_id"
    t.index ["profile_id"], name: "index_reminds_on_profile_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "profiles"
  add_foreign_key "list_deadlines", "categories"
  add_foreign_key "list_deadlines", "lists"
  add_foreign_key "list_deadlines", "profiles"
  add_foreign_key "list_reminds", "lists"
  add_foreign_key "list_reminds", "profiles"
  add_foreign_key "lists", "categories"
  add_foreign_key "profiles", "users"
  add_foreign_key "reminds", "list_deadlines"
  add_foreign_key "reminds", "list_reminds"
  add_foreign_key "reminds", "profiles"
end
