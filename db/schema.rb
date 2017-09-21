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

ActiveRecord::Schema.define(version: 20170921162130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventory_entries", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "inventory_movement_id"
    t.integer  "supplier_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "inventory_movements", force: :cascade do |t|
    t.string   "type_movement"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "product_id"
  end

  create_table "inventory_outputs", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "inventory_movement_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name_product"
    t.float    "precio_compra"
    t.float    "precio_venta"
    t.integer  "stock_available"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name_supplier"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "inventory_entries", "inventory_movements"
  add_foreign_key "inventory_entries", "suppliers"
  add_foreign_key "inventory_movements", "products"
  add_foreign_key "inventory_outputs", "inventory_movements"
end
