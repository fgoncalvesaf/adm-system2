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

ActiveRecord::Schema.define(version: 20170328153317) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "address"
    t.string   "complement"
    t.string   "zip_code"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "phone"
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.decimal  "value",       precision: 8, scale: 2
    t.text     "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "installments", force: :cascade do |t|
    t.integer  "sale_id"
    t.date     "payment_date"
    t.decimal  "value",        precision: 8, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["sale_id"], name: "index_installments_on_sale_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "sale_id"
    t.integer  "quantity"
    t.decimal  "total",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["sale_id"], name: "index_items_on_sale_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",       precision: 8, scale: 2
    t.string   "photo"
    t.text     "description"
    t.integer  "status"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "client_id"
    t.date     "request_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["client_id"], name: "index_requests_on_client_id"
    t.index ["product_id"], name: "index_requests_on_product_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "client_id"
    t.date     "sale_date"
    t.decimal  "total",       precision: 8, scale: 2
    t.decimal  "remaining",   precision: 8, scale: 2
    t.integer  "status"
    t.integer  "discount_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["discount_id"], name: "index_sales_on_discount_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "total",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
