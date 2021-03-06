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

ActiveRecord::Schema.define(version: 2021_10_27_041157) do

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.integer "vote"
    t.float "creation_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
    t.integer "voted_count", default: 0
    t.integer "order_id"
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "amount"
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_order_id"
    t.time "creation_time"
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["total_order_id"], name: "index_orders_on_total_order_id"
  end

  create_table "total_orders", force: :cascade do |t|
    t.integer "total_price"
    t.time "last_create_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.float "large_time"
    t.index ["user_id"], name: "index_total_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "sex"
    t.integer "age"
    t.boolean "admin"
    t.integer "recom_count"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "voting", default: false
    t.index ["item_id"], name: "index_votes_on_item_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "items", "orders"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "total_orders"
  add_foreign_key "total_orders", "users"
  add_foreign_key "votes", "items"
  add_foreign_key "votes", "users"
end
