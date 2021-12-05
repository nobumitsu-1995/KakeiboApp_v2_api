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

ActiveRecord::Schema.define(version: 2021_12_05_055138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "big_category", null: false
    t.string "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fixed_costs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "scheduled_date", null: false
    t.string "note"
    t.string "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "payment_method_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_fixed_costs_on_category_id"
    t.index ["payment_method_id"], name: "index_fixed_costs_on_payment_method_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.date "date", null: false
    t.string "note"
    t.string "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "payment_method_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["payment_method_id"], name: "index_items_on_payment_method_id"
  end

  create_table "money_infos", force: :cascade do |t|
    t.integer "total_assets", null: false
    t.integer "target_amount"
    t.date "deadline"
    t.string "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "monthly_budget"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "income", default: false, null: false
    t.string "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "fixed_costs", "categories"
  add_foreign_key "fixed_costs", "payment_methods"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "payment_methods"
end
